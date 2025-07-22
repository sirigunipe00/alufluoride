import 'dart:convert';

import 'dart:io';

import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/contract_employee/data/contract_employee_repo.dart';
import 'package:alufluoride/features/contract_employee/model/contract_employee_form.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'contract_employee_cubit.freezed.dart';

enum ContractEmployeeView { create, edit, completed }

extension ActionType on ContractEmployeeView {
  String toName() {
    return switch (this) {
      ContractEmployeeView.create => 'Create',
      ContractEmployeeView.edit => 'Submit',
      ContractEmployeeView.completed => 'Submitted',
    };
  }
}

@injectable
class CreateContractEmployeeCubit
    extends AppBaseCubit<CreateContractEmployeeState> {
  CreateContractEmployeeCubit(this.repo)
      : super(CreateContractEmployeeState.initial());
  final ContractEmployeeRepo repo;

  void onValueChanged({
    String? creation,
    String? modified,
    String? modifiedBy,
    int? idx,
    String? name,
    String? amendedFrom,
    String? contractor,
    String? skillType,
    int? dailyWages,
    String? contractEmployee,
    String? genders,
    String? aadhaar,
    String? dob,
    String? pf,
    int? esi,
    File? photo,
    String? supplierGroup,
    String? supplierType,
  }) {
    shouldAskForConfirmation.value = true;
    final form = state.form;

      final photos = photo.isNull
        ? form.photo
        : base64Encode(photo!.readAsBytesSync());

    final newForm = form.copyWith(
      name: form.name,
      creation: creation ?? form.creation,
      modified: modified ?? form.modified,
      modifiedBy: modifiedBy ?? form.modifiedBy,
      idx: idx ?? form.idx,
      amendedFrom: amendedFrom ?? form.amendedFrom,
      contractor: contractor ?? form.contractor,
      skillType: skillType ?? form.skillType,
      dailyWages: dailyWages ?? form.dailyWages,
      photo: photos,
      contractEmployee: contractEmployee ?? form.contractEmployee,
      gender: genders ?? form.gender,
      aadhaar: aadhaar ?? form.aadhaar,
      dob: dob ?? form.dob,
      pf: pf ?? form.pf,
      esi: esi ?? form.esi,
    );

    emitSafeState(state.copyWith(form: newForm));
  }

  void addInvUrls(List<String> urls) {
    // final form = state.form.copyWith(addInvs: urls);
    // emitSafeState(state.copyWith(form: form));
  }

  // void removeLineAt(int index) {
  //   final lines = [...state.lines];
  //   final lineItem = lines.elementAt(index);
  //   lines.removeAt(index);
  //   // final deletedLines = [...state.form.deletedLines,lineItem.name].nonNulls;
  //   // final totalAmt =  lines.fold(0.0, (previousValue, element) => previousValue+( element.amount ?? 0) );
  //   // final form = state.form.copyWith(totalAmount:totalAmt ,deletedLines:deletedLines.toList());

  //   // emit(state.copyWith(lines: lines, form:form ));
  // }

  void initDetails(Object? entry) {
    shouldAskForConfirmation.value = false;
    if (entry is ContractEmployeeForm) {
      print('entry.creation---:${entry}');
      if (entry.creation == null) {
        final creationDate = DFU.friendlyFormat(DFU.now());
        final createdtime = DFU.hhMMss(DFU.now());
        emitSafeState(state.copyWith(
          form: entry.copyWith(creation: creationDate, modified: createdtime),
        ));
        return;
      }
      final parsedDate =
          DFU.toDateTime(entry.creation.valueOrEmpty, 'yyyy-MM-dd');
      final formattedStr = DFU.friendlyFormat(parsedDate);

      final status = entry.docStatus;

      final isSubmitted = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status!), 'Submitted');
      final isCancelled = StringUtils.equalsIgnoreCase(
          StringUtils.docStatus(status).trim(), 'Cancelled');
      final mode = (isSubmitted || isCancelled)
          ? ContractEmployeeView.completed
          : ContractEmployeeView.edit;

      print('form--:$entry');
      emitSafeState(state.copyWith(
        form: entry.copyWith(creation: formattedStr),
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
    // final item = ContractEmployeeLinesForm(
    //   serialNumber: code,
    //   assetNumber: int.tryParse(asset),
    //   materialName: name,
    //   quantity: double.tryParse(qty),
    //   oums: uom,
    //   // isreturn: isreturn ? 1 : 0,
    //   amount: double.tryParse(amt),
    // );
    // final prevLines = [...state.lines];
    // prevLines.add(item);
    // final ttlAmt = (state.form.totalAmount ?? 0.0) + (item.amount ?? 0.0);
    // final updForm = state.form.copyWith(totalAmount: ttlAmt);
    emitSafeState(state);
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
          ContractEmployeeView.create => ContractEmployeeView.edit,
          ContractEmployeeView.edit ||
          ContractEmployeeView.completed =>
            ContractEmployeeView.completed,
        };

        final status = switch (state.view) {
          ContractEmployeeView.create => 'Draft',
          ContractEmployeeView.edit ||
          ContractEmployeeView.completed =>
            'Submitted',
        };
        if (state.view == ContractEmployeeView.create) {
          // final startTime = DateTime.now();

          final response = await repo.createContractEmployee(state.form);
          // final endTime = DateTime.now();

          // final duration = endTime.difference(startTime);

          return response.fold(
            (l) {
              emitSafeState(state.copyWith(
                isLoading: false,
                error: l,
              ));
            },
            (r) {
              shouldAskForConfirmation.value = false;
              // final doctatus = r.second;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(name: r.first, docStatus: 0),
                successMsg: 'Doc No : ${r.second}',
                view: nextMode,
              ));
            },
          );
        } else {
          final response = await repo.submitContractEmployee(state.form);

          return response.fold(
            (l) => emitSafeState(state.copyWith(isLoading: false, error: l)),
            (r) {
              shouldAskForConfirmation.value = false;
              emitSafeState(state.copyWith(
                isLoading: false,
                isSuccess: true,
                form: state.form.copyWith(docStatus: 1),
                successMsg: r.first,
                view: ContractEmployeeView.completed,
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
class CreateContractEmployeeState with _$CreateContractEmployeeState {
  const factory CreateContractEmployeeState({
    required ContractEmployeeForm form,
    required bool isLoading,
    required bool isSuccess,
    required ContractEmployeeView view,
    String? successMsg,
    Failure? error,
  }) = _CreateContractEmployeeState;

  factory CreateContractEmployeeState.initial() {
    final creationDate = DFU.friendlyFormat(DFU.now());
    final createdtime = DFU.hhMMss(DFU.now());

    return CreateContractEmployeeState(
      form: ContractEmployeeForm(creation: creationDate, modified: createdtime),
      view: ContractEmployeeView.create,
      isLoading: false,
      isSuccess: false,
    );
  }
}
