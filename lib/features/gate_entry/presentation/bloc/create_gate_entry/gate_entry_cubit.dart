import 'dart:io';

import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/gate_entry/data/gate_entry_repo.dart';
import 'package:alufluoride/features/gate_entry/model/gate_entry_form.dart';
import 'package:alufluoride/features/gate_entry/model/gate_entry_lines_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'gate_entry_cubit.freezed.dart';

enum GateEntryView { create, edit, completed }

extension ActionType on GateEntryView {
  String toName() {
    return switch (this) {
      GateEntryView.create => 'Create',
      GateEntryView.edit => 'Submit',
      GateEntryView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateGateEntryCubit extends AppBaseCubit<CreateGateEntryState> {
  CreateGateEntryCubit(this.repo) : super(CreateGateEntryState.initial());
  final GateEntryRepo repo;

  void onValueChanged({
    String? vehicleRequest,
    String? gateEntryType,
    String? driverName,
    String? driverMobileNo,
    String? entryDate,
    String? vehicle,
    File? vehiclephoto,
    String? payType,
    File? beforeWork,
    String? inTime,
    String? outTime,
    String? perHrAmt,
    String? remarks,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;

    final newForm = form.copyWith(
      name: form.name,
      status: form.status,
      vehicleRequest: vehicleRequest ?? form.vehicleRequest,
      intime: inTime ?? form.intime,
      outTime: outTime ?? form.outTime,
      vehicle: vehicle ?? form.vehicle,
      payType: payType ?? form.payType,
      remarks: remarks ?? form.remarks,
      entryType: gateEntryType ?? form.entryType,
      gateEntryDate: entryDate ?? form.gateEntryDate,
      beforeWork: beforeWork ?? form.beforeWork,
      vehiclePhoto: vehiclephoto ?? form.vehiclePhoto
    );
    emitSafeState(state.copyWith(form: newForm));
  }

  void addInvUrls(List<String> urls) {
    // final form = state.form.copyWith(addInvs: urls);
    // emitSafeState(state.copyWith(form: form));
  }

  void removeLineAt(int index) {
    final lines = [...state.lines];
    final lineItem = lines.elementAt(index);
    lines.removeAt(index);
    // final deletedLines = [...state.form.deletedLines,lineItem.name].nonNulls;
    // final totalAmt =  lines.fold(0.0, (previousValue, element) => previousValue+( element.amount ?? 0) );
    // final form = state.form.copyWith(totalAmount:totalAmt ,deletedLines:deletedLines.toList());

    // emit(state.copyWith(lines: lines, form:form ));
  }

  void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;
    if (entry is GateEntryForm) {
      final parsedDate =
          DFU.toDateTime(entry.gateEntryDate.valueOrEmpty, 'yyyy-MM-dd');
      final formattedStr = DFU.friendlyFormat(parsedDate);

      final status = entry.docstatus;

      final isSubmitted = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status!), 'Submitted');
      final isCancelled = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status).trim(), 'Cancelled');
      final mode = (isSubmitted || isCancelled)
          ? GateEntryView.completed
          : GateEntryView.edit;
      emitSafeState(state.copyWith(
        form: entry.copyWith(gateEntryDate: formattedStr),
        view: mode,
      ));
    }
    if (entry == null) return;
  }

  void addLineItem({
    required String name,
    required String code,
    required String asset,
    required String qty,
    required String uom,
    // required bool isreturn,
    required String amt,
    String? description,
  }) {
    shouldAskForConfirmation.value = true;
    final item = GateEntryLinesForm(
      serialNumber: code,
      assetNumber: int.tryParse(asset),
      materialName: name,
      quantity: double.tryParse(qty),
      oums: uom,
      // isreturn: isreturn ? 1 : 0,
      amount: double.tryParse(amt),
    );
    final prevLines = [...state.lines];
    prevLines.add(item);
    // final ttlAmt = (state.form.totalAmount ?? 0.0) + (item.amount ?? 0.0);
    // final updForm = state.form.copyWith(totalAmount: ttlAmt);
    emitSafeState(state.copyWith(lines: prevLines));
  }
  // {
  //   shouldAskForConfirmation.value = true;
  //   final item = GateEntryLinesForm(
  //     serialNumber: code,
  //     assetNumber: int.tryParse(asset),
  //     materialName: name,
  //     quantity: double.tryParse(qty),
  //     oums: uom,
  //     isreturn: isreturn ? 1 : 0,
  //     amount: double.tryParse(amt),
  //   );
  //   final prevLines = [...state.lines];
  //   prevLines.add(item);
  //   final ttlAmt = (state.form.totalAmount ?? 0.0) + (item.amount ?? 0.0);
  //   final updForm = state.form.copyWith(totalAmount: ttlAmt);
  //   emitSafeState(state.copyWith(lines: prevLines, form: updForm));
  // }

  void addAllLines(List<GateEntryLinesForm> lines) {
    emitSafeState(state.copyWith(lines: lines));
  }

  void removeFile(int indx) {
    // final invs = [...state.form.invoiceImg];
    // invs.removeAt(indx);
  }

  void save() async {
    final validation = _validate();
    return validation.fold(
      () async {
        emitSafeState(state.copyWith(isLoading: true, isSuccess: false));
        final nextMode = switch (state.view) {
          GateEntryView.create => GateEntryView.edit,
          GateEntryView.edit ||
          GateEntryView.completed =>
            GateEntryView.completed,
        };

        final status = switch (state.view) {
          GateEntryView.create => 'Draft',
          GateEntryView.edit || GateEntryView.completed => 'Submitted',
        };
        if (state.view == GateEntryView.create) {
          final startTime = DateTime.now();

          final response = await repo.createGateEntry(state.form, state.lines);

          final endTime = DateTime.now();

          final duration = endTime.difference(startTime);

          return response.fold(
            (l) {
              emitSafeState(state.copyWith(isLoading: false, error: l));
            },
            (r) {
              shouldAskForConfirmation.value = false;
              final docstatus = r.second;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(
                  status: status,
                  name: docstatus,
                ),
                successMsg: r.first,
                view: nextMode,
              ));
            },
          );
        } else {
          final response = await repo.submitGateEntry(state.form, state.lines);

          return response.fold(
            (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
            (r) {
              shouldAskForConfirmation.value = false;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(docstatus: 1),
                successMsg: r.first,
                view: GateEntryView.completed,
              ));
            },
          );
        }
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
    final form = state.form;
    // final isMand = form.entryType == 'Gatepass Returnable' &&
    //     form.expectedReturnDate.doesNotHaveValue;
    //   if (isMand) {
    //   return optionOf(const Pair('Select Expected Return Date', 31));
    // }
    //  else if (form.senderName.isNull) {
    //   return optionOf(const Pair('Enter Sender Name', 6));
    // }
    // else if (form.poNumber.doesNotHaveValue) {
    //   return optionOf(const Pair('Enter PO Number', 12));
    // }
    // if (form.isewayBill == 1) {
    //   if (form.ewayBill.doesNotHaveValue) {
    //     return optionOf(const Pair('Enter Eway Number', 13));
    //   }
    // }
    // if (form.vehicleType.isNull) {
    //   return optionOf(const Pair('Select Vehicle Type', 14));
    // } else if (form.vehicleNumber.isNull && form.vehicleType != 'By Hand') {
    //   return optionOf(const Pair('Enter Vehicle Number', 17));
    // } else if (form.driverName.isNull && form.vehicleType != 'By Hand') {
    //   return optionOf(const Pair('Enter Driver Name', 18));
    // } else if (form.drivermobileNo.isNull && form.vehicleType != 'By Hand') {
    //   return optionOf(const Pair('Enter Driver Mobile Number', 19));
    // }
    // else if (form.totalAmount.isNull) {
    //   return optionOf(const Pair('Enter Total Amount', null));
    // }
    // else if (form.weight.isNull && form.weightSlipNo != null) {
    //   return optionOf(const Pair('Enter weight in Kgs', 21));
    // }
    //  else if (form.weighmentDate.isNull) {
    //   return optionOf(const Pair('Enter Weighment Date', 22));
    // } else if (form.weighmentTime.isNull) {
    //   return optionOf(const Pair('Enter weighment Time', 23));
    // }
    // else if(state.lines.isEmpty){
    //   return optionOf(const Pair('Add Atleast One GateEnrty Lineitem to Proceed Further', null));

    // }

    return const None();
  }
}

@freezed
class CreateGateEntryState with _$CreateGateEntryState {
  const factory CreateGateEntryState({
    required GateEntryForm form,
    required bool isLoading,
    required bool isSuccess,
    required GateEntryView view,
    required List<GateEntryLinesForm> lines,
    String? successMsg,
    Failure? error,
  }) = _CreateGateEntryState;

  factory CreateGateEntryState.initial() {
    final creationDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());

    return CreateGateEntryState(
      lines: [],
      form: GateEntryForm(
        gateEntryDate: creationDate,
        entryTime: createdtime,
      ),
      view: GateEntryView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}
