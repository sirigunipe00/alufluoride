
import 'package:freezed_annotation/freezed_annotation.dart';
part 'contract_employee_form.freezed.dart';
part 'contract_employee_form.g.dart';



@freezed
class ContractEmployeeForm with _$ContractEmployeeForm {
  const factory ContractEmployeeForm({
     String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'modified') String? modified,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docStatus,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'contractor_name') String? contractor,
    @JsonKey(name: 'skill_type') String? skillType,
    @JsonKey(name: 'daily_wages') int? dailyWages,
    @JsonKey(name: 'contract_employee_name') String? contractEmployee,
    @JsonKey(name: 'gender') String? gender,
    @JsonKey(name: 'aadhaar') String? aadhaar,
    @JsonKey(name: 'dob') String? dob,
    @JsonKey(name: 'pf') String? pf,
    @JsonKey(name: 'esi') int? esi,
    @JsonKey(name: 'photo') String? photo,
  }) = _ContractEmployeeForm;

  factory ContractEmployeeForm.fromJson(Map<String, dynamic> json) =>
      _$ContractEmployeeFormFromJson(json);
}
