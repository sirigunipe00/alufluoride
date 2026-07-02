import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/dispatch_bagging/data/dispatch_bagging_repo.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_bagging.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_items.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'create_dispatch_cubit.freezed.dart';

enum DispatchView { create, edit, completed, submitted }

extension ActionType on DispatchView {
  String toName() {
    return switch (this) {
      DispatchView.create => 'Create',
      DispatchView.edit => 'Update',
      DispatchView.completed => 'Submit',
      DispatchView.submitted => 'Submitted',
    };
  }
}

@injectable
class CreateDispatchCubit extends AppBaseCubit<CreateDispatchState> {
  CreateDispatchCubit(this.repo) : super(CreateDispatchState.initial());
  final DispatchBaggingRepo repo;

  void onValueChanged({
    String? bagNo,
    String? name,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.items;

    final newForm = form.copyWith(
      name: name ?? form.name,
      bagNo: bagNo ?? form.bagNo,
    );
    emitSafeState(state.copyWith(items: newForm));
  }

  void initDetails(Object? entry) async {
    shouldAskForConfirmation.value = false;
    if (entry is DispatchBaggingModel) {
      final form = entry.copyWith();
      final mode =
          entry.docstatus == 1 ? DispatchView.submitted : DispatchView.edit;

      emitSafeState(state.copyWith(form: form, view: mode, isLoading: true));

      final response = await repo.fetchItems(entry.name ?? "");
      response.fold(
        (l) => emitSafeState(
          state.copyWith(
            isLoading: false,
            error: l,
          ),
        ),
        (items) {
          emitSafeState(
            state.copyWith(
              isLoading: false,
              form: form,
              lines: items,
              newlines: [],
            ),
          );
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


void addLineItem({required DispatchItemsModel lineItem}) {

  if (state.form.docstatus == 1) return;

  shouldAskForConfirmation.value = true;
  final currentLines = [...state.lines];
  final currentNewLines = [...state.newlines];

  String bagNo = lineItem.bagNo.toString();

  final newLine = DispatchItemsModel(bagNo: bagNo);

  final updatedLines = [...currentLines, newLine];
  final updatedNewLines = [...currentNewLines, newLine];

  emitSafeState(state.copyWith(
    lines: updatedLines,
    newlines: updatedNewLines,
    form: state.form.copyWith(),
  ));
}

  void addAllLines(List<DispatchItemsModel> lines) {
    emitSafeState(state.copyWith(lines: lines));
  }

  void save() async {
    final validation = _validate();

    return validation.fold(
      () async {
        emitSafeState(state.copyWith(isLoading: true, isSuccess: false));

        final response = await repo.createDispatch(
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
                    ? DispatchView.completed
                    : DispatchView.edit,
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
class CreateDispatchState with _$CreateDispatchState {
  const factory CreateDispatchState({
    required bool isLoading,
    required bool isSuccess,
    required DispatchView view,
    required List<DispatchItemsModel> lines,
    required List<DispatchItemsModel> newlines,
    required DispatchBaggingModel form,
    required DispatchItemsModel items,
    String? successMsg,
    Failure? error,
  }) = _CreateDispatchState;

  factory CreateDispatchState.initial() {
    return const CreateDispatchState(
      lines: <DispatchItemsModel>[],
      form: DispatchBaggingModel(),
      items: DispatchItemsModel(),
      view: DispatchView.create,
      isLoading: false,
      isSuccess: false,
      newlines: [],
    );
  }
}
