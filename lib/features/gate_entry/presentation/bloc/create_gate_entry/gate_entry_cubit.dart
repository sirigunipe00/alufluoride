import 'dart:convert';
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

  void onValueChanged(
      {String? vehicleRequest,
      String? gateEntryType,
      String? driverName,
      String? driverMobileNo,
      String? entryDate,
      String? vehicle,
      File? vehiclephoto,
      String? payType,
      File? beforeWork,
      File? afterWork,
      String? inTime,
      String? outTime,
      String? perHrAmt,
      String? remarks,
      String? invDate,
      String? poNumber,
      String? vendorInvQty,
      String? invAmt,
      String? vendorInvNum,
      File? venorInvPhoto,
      String? venorInvDate,
      int? qtyTonnes,
      double? ratePerTonnes}) {
    shouldAskForConfirmation.value = true;
    final form = state.form;


         final vendorInvPhoto = venorInvPhoto.isNull
        ? form.vendorInvPhoto
        : base64Encode(venorInvPhoto!.readAsBytesSync());

         final vehPhoto = vehiclephoto.isNull
        ? form.vehiclePhoto
        : base64Encode(vehiclephoto!.readAsBytesSync());


         final beforeWorkFile = beforeWork.isNull
        ? form.beforeWork
        : base64Encode(beforeWork!.readAsBytesSync());

         final afterWorkFile = afterWork.isNull
        ? form.afterWork
        : base64Encode(afterWork!.readAsBytesSync());



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
        beforeWork: beforeWorkFile,
        vehiclePhoto: vehPhoto,
        // vehiclephoto ?? form.vehiclePhoto,
        driverName: driverName ?? form.driverName,
        drivermobileNo: driverMobileNo ?? form.drivermobileNo,
        invoiceAmt: double.tryParse(invAmt ?? '') ?? form.invoiceAmt,
        invoiceQnty: double.tryParse(vendorInvQty ?? '') ?? form.invoiceQnty,
        perHrAmt: perHrAmt ?? form.perHrAmt,
        poNumber: poNumber ?? form.poNumber,
        vendorInvNum: vendorInvNum ?? form.vendorInvNum,
        vendorInvPhoto: vendorInvPhoto,
        vendorInvoiceDate: venorInvDate ?? form.vendorInvoiceDate,
        qtyinTonnes: qtyTonnes ?? form.qtyinTonnes,
        ratePerTonnes: ratePerTonnes ?? form.ratePerTonnes,
        afterWork: afterWorkFile);
    emitSafeState(state.copyWith(form: newForm));
  }

  void addInvUrls(List<String> urls) {
  }

  void removeLineAt(int index) {
    final lines = [...state.lines];
    lines.removeAt(index);
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
          final response = await repo.createGateEntry(state.form, state.lines);
          return response.fold(
            (l) {
              emitSafeState(state.copyWith(
                isLoading: false,
                error: l,
              ));
            },
            (r) {
              shouldAskForConfirmation.value = false;
              // final docstatus = r.second;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form
                    .copyWith(status: status, name: r.first, docstatus: 0),
                successMsg: 'Gate Entry Created Succesfully',
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
