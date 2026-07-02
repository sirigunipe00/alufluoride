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
            lines: validItems,
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

  void addLineItem({required double weight, required File imageFile, required String palletWeight}) {
    shouldAskForConfirmation.value = true;
    final currentLines = [...state.lines];
    final currentNewLines = [...state.newlines];
    if (currentLines.length >= 10) return;

    int nextBagIndex = currentLines.length + 1;
    String bagNo = nextBagIndex.toString();
    String batchNo = state.form.batch ?? "N/A";
    $logger.devLog('Adding line item: bagNo=$bagNo, weight=$weight, palletWeight=$palletWeight');
  

    final newLine = ItemModel(
      bagNo: bagNo,
      qty: weight,
      serialNo: "$batchNo - $bagNo",
      weighingScale: base64Encode(imageFile.readAsBytesSync()),
      stickerPrinted: 0,
      palletWeight: double.tryParse(palletWeight),
    );

    final updatedLines = [...currentLines, newLine];

    final updatedNewLines = [...currentNewLines, newLine];

    double totalQty =
        updatedLines.fold(0, (sum, item) => sum + (item.qty ?? 0));

    emitSafeState(state.copyWith(
      lines: updatedLines,
      newlines: updatedNewLines,
      form: state.form.copyWith(totalBatchQty: totalQty),
    ));
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


  void save() async {
  final validation = _validate();

  return validation.fold(
    () async {
      emitSafeState(state.copyWith(isLoading: true, isSuccess: false));

      final response = await repo.createBaggingEntry(
        state.newlines,
        state.form.name ?? "",
      );

      return response.fold(
        (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
        (r) {
          shouldAskForConfirmation.value = false;

          final shouldShowSubmit = state.lines.length >= 10;

          emitSafeState(
            state.copyWith(
              form: state.form.copyWith(
                name: state.form.name,
                docstatus: 0,
              ),
              isLoading: false,
              isSuccess: true,
              view: shouldShowSubmit
                  ? BaggingEntryView.completed
                  : BaggingEntryView.edit,      
              successMsg: shouldShowSubmit
                  ? 'Ready for submission'
                  : 'Bag updated successfully',
            ),
          );
        },
      );
    },
    _emitError,
  );
}



  // void save() async {
  //   final validation = _validate();
  //   return validation.fold(
  //     () async {
  //       emitSafeState(state.copyWith(isLoading: true, isSuccess: false));

  //       if (state.view == BaggingEntryView.edit ||
  //           state.view == BaggingEntryView.create) {
  //         // final newLinesOnly = state.lines
  //         //     .where((item) => item.name == null || item.name!.isEmpty)
  //         //     .toList();

  //         final response = await repo.createBaggingEntry(
  //             state.newlines, state.form.name ?? "");

  //         return response.fold(
  //           (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
  //           (r) {
  //             shouldAskForConfirmation.value = false;
  //             // final docStatus = r.second;
  //             // initDetails(state.form);
  //             emitSafeState(state.copyWith(
  //               form: state.form.copyWith(name: state.form.name, docstatus: 0),
  //               isLoading: false,
  //               isSuccess: true,
  //               view: BaggingEntryView.completed,
  //               successMsg: 'Bag saved successfully',
  //             ));
  //           },
  //         );
  //       }
  //     },
  //     _emitError,
  //   );
  // }

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
