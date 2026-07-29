
import 'dart:convert';
import 'dart:io';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/production_baggging_entry/data/bagging_entry_repo.dart';
import 'package:alufluoride/features/production_baggging_entry/model/bagging_entry_model.dart';
import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_bagging_entry_cubit.freezed.dart';

enum BaggingEntryView { create, edit, completed, submitted }

extension ActionType on BaggingEntryView {
  String toName() {
    return switch (this) {
      BaggingEntryView.create => 'Create',
      BaggingEntryView.edit => 'Update',
      BaggingEntryView.completed => 'Submit',
      BaggingEntryView.submitted => 'Submitted',
    };
  }
}

@injectable
class CreateBaggingEntryCubit extends AppBaseCubit<CreateBaggingEntryState> {
  CreateBaggingEntryCubit(this.repo) : super(CreateBaggingEntryState.initial());
  final BaggingEntryRepo repo;

  void onValueChanged({
    String? qty,
    String? serialNo,
    String? bagNo,
    String? weighingScale,
    int? stickerPrinted,
    String? name,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.items;

    final newForm = form.copyWith(
      name: name ?? form.name,
      bagNo: bagNo ?? form.bagNo,
      qty: qty != null ? double.tryParse(qty) : form.qty,
      serialNo: serialNo ?? form.serialNo,
      weighingScale: weighingScale ?? form.weighingScale,
      stickerPrinted: stickerPrinted ?? form.stickerPrinted,
    );
    emitSafeState(state.copyWith(items: newForm));
  }

  void initDetails(Object? entry) async {
    shouldAskForConfirmation.value = false;
    if (entry is BaggingEntryModel) {
      final form = entry.copyWith();
      final mode = entry.docstatus == 1
          ? BaggingEntryView.submitted
          : BaggingEntryView.edit;

      emitSafeState(state.copyWith(form: form, view: mode, isLoading: true));

      final response = await repo.fetchItems(entry.name ?? "");
      response.fold(
        (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
        (items) {
          final validItems =
              items.where((e) => e.qty != null && e.qty! > 0).toList();

          double totalQty =
              validItems.fold(0.0, (sum, item) => sum + (item.qty ?? 0.0));
          emitSafeState(state.copyWith(
            isLoading: false,
            lines: items, 
            form: form.copyWith(totalBatchQty: totalQty),
          ));
        },
      );
    }
  }

  void addnewItem() {
    emitSafeState(state.copyWith(
      newlines: [],
      form: state.form,
    ));
  }
  Future<void> addEmptyPalletLine({
    required double weightOfPalletandBag,
    required File emptyImage,
  }) async {
    shouldAskForConfirmation.value = true;
    final currentLines = [...state.lines];
    if (currentLines.length >= 40) return;

    int nextBagIndex = currentLines.length + 1;
    String bagNo = nextBagIndex.toString();
    String batchNo = state.form.batch ?? "N/A";

    $logger.devLog(
      'Adding empty-pallet line: bagNo=$bagNo, weightOfPalletandBag=$weightOfPalletandBag',
    );

    final newLine = ItemModel(
      bagNo: bagNo,
      serialNo: "$batchNo - $bagNo",
      stickerPrinted: 0,
      weightOfPalletandBag: weightOfPalletandBag,
      emptyPalletImage: base64Encode(emptyImage.readAsBytesSync()),
      qty: null, 
    );

    final updatedLines = [...currentLines, newLine];

    emitSafeState(state.copyWith(
      lines: updatedLines,
      newlines: [newLine],
    ));

    await save(
    successMessage:
        'Empty pallet saved successfully\nWeight: ${weightOfPalletandBag.toStringAsFixed(2)} kg',
  );
  }

  // Future<void> updateFilledWeightForLine({
  //   required int lineIndex,
  //   required double filledWeight,
  //   required File filledImage,
  // }) async {
  //   final currentLines = [...state.lines];
  //   if (lineIndex < 0 || lineIndex >= currentLines.length) return;

  //   final line = currentLines[lineIndex];
  //   final emptyWeight = line.weightOfPalletandBag ?? 0;
  //   final bagWeight = filledWeight - emptyWeight;

  //   if (bagWeight <= 0) {
  //     emitSafeState(state.copyWith(
  //       error: const Failure(
  //         title: 'Invalid Weight',
  //         error: 'Filled weight must be greater than the empty pallet + bag weight.',
  //       ),
  //     ));
  //     return;
  //   }

  //   final updatedLine = line.copyWith(
  //     qty: bagWeight,
  //     actualBagWeight: filledWeight,
  //     weighingScale: base64Encode(filledImage.readAsBytesSync()),
  //   );

  //   currentLines[lineIndex] = updatedLine;

  //   double totalQty =
  //       currentLines.fold(0, (sum, item) => sum + (item.qty ?? 0));

  //   emitSafeState(state.copyWith(
  //     lines: currentLines,
  //     newlines: [updatedLine],
  //     form: state.form.copyWith(totalBatchQty: totalQty),
  //   ));
  // }
Future<void> updateFilledWeightForLine({
  required int lineIndex,
  required double filledWeight,
  required File filledImage,
}) async {
  final currentLines = [...state.lines];
  if (lineIndex < 0 || lineIndex >= currentLines.length) return;

  final line = currentLines[lineIndex];
  final emptyWeight = line.weightOfPalletandBag ?? 0;
  final bagWeight = filledWeight - emptyWeight;

  if (bagWeight <= 0) {
    emitSafeState(state.copyWith(
      error: const Failure(
        title: 'Invalid Weight',
        error: 'Filled weight must be greater than the empty pallet + bag weight.',
      ),
    ));
    return;
  }

  final updatedLine = line.copyWith(
    qty: bagWeight,
    actualBagWeight: filledWeight,
    weighingScale: base64Encode(filledImage.readAsBytesSync()),
  );

  currentLines[lineIndex] = updatedLine;

  double totalQty =
      currentLines.fold(0, (sum, item) => sum + (item.qty ?? 0));

  emitSafeState(state.copyWith(
    lines: currentLines,
    newlines: [updatedLine],
    form: state.form.copyWith(totalBatchQty: totalQty),
  ));

  await save(
    successMessage:
        'Bag filled successfully\nWeight: ${bagWeight.toStringAsFixed(2)} kg',
  );
}
  Future<void> save({String successMessage = 'Bag updated successfully'}) async {
    emitSafeState(state.copyWith(isLoading: true, isSuccess: false));

    final response = await repo.createBaggingEntry(
      state.newlines,
      state.form.name ?? "",
    );

    await response.fold(
      (l) async => emitSafeState(state.copyWith(isLoading: false, error: l)),
      (r) async {
        shouldAskForConfirmation.value = false;

        final itemsResponse = await repo.fetchItems(state.form.name ?? "");
        itemsResponse.fold(
          (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
          (items) {
            double totalQty =
                items.fold(0.0, (sum, item) => sum + (item.qty ?? 0.0));
            emitSafeState(state.copyWith(
              isLoading: false,
              isSuccess: true,
              lines: items,
              newlines: [],
              successMsg: successMessage,
              form: state.form.copyWith(
                name: state.form.name,
                docstatus: 0,
                totalBatchQty: totalQty,
              ),
            ));
          },
        );
      },
    );
  }

  void addAllLines(List<ItemModel> lines) {
    emitSafeState(state.copyWith(lines: lines));
  }

  void removeFile(int indx) {}

  void submit() async {
    final validation = _validate();
    return validation.fold(
      () async {
        emitSafeState(state.copyWith(isLoading: true, isSuccess: false));

        final response = await repo.submitBaggingEntry(state.form.name ?? "");

        return response.fold(
          (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
          (r) {
            shouldAskForConfirmation.value = false;
            emitSafeState(state.copyWith(
              form: state.form.copyWith(name: state.form.name, docstatus: 1),
              isLoading: false,
              isSuccess: true,
              successMsg: r,
            ));
          },
        );
      },
      _emitError,
    );
  }

  void _emitError(Pair<String, int?> error) {
    final failure = Failure(
        error: error.first, title: 'Missing Fields', status: error.second);
    emitSafeState(state.copyWith(error: failure, isLoading: false));
  }

  void errorHandled() {
    emitSafeState(state.copyWith(
        error: null, isLoading: false, isSuccess: false, successMsg: null));
  }

  Option<Pair<String, int?>> _validate() {
    final items = state.lines;

    if (items.isEmpty) {
      return optionOf(const Pair('At least one item is required to submit', 0));
    }

    return const None();
  }
}

@freezed
class CreateBaggingEntryState with _$CreateBaggingEntryState {
  const factory CreateBaggingEntryState({
    required BaggingEntryModel form,
    required bool isLoading,
    required bool isSuccess,
    required BaggingEntryView view,
    required List<ItemModel> lines,
    required List<ItemModel> newlines,
    required ItemModel items,
    String? successMsg,
    Failure? error,
  }) = _CreateBaggingEntryState;

  factory CreateBaggingEntryState.initial() {
    return const CreateBaggingEntryState(
      lines: <ItemModel>[],
      items: ItemModel(),
      form: BaggingEntryModel(),
      view: BaggingEntryView.create,
      isLoading: false,
      isSuccess: false,
      newlines: [],
    );
  }
}