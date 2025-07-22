// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_employee_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractEmployeeFormImpl _$$ContractEmployeeFormImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractEmployeeFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docStatus: (json['docstatus'] as num?)?.toInt(),
      idx: (json['idx'] as num?)?.toInt(),
      amendedFrom: json['amended_from'] as String?,
      contractor: json['contractor_name'] as String?,
      skillType: json['skill_type'] as String?,
      dailyWages: (json['daily_wages'] as num?)?.toInt(),
      contractEmployee: json['contract_employee_name'] as String?,
      gender: json['gender'] as String?,
      aadhaar: json['aadhaar'] as String?,
      dob: json['dob'] as String?,
      pf: json['pf'] as String?,
      esi: (json['esi'] as num?)?.toInt(),
      photo: json['photo'] as String?,
    );

Map<String, dynamic> _$$ContractEmployeeFormImplToJson(
        _$ContractEmployeeFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creation,
      'modified': instance.modified,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docStatus,
      'idx': instance.idx,
      'amended_from': instance.amendedFrom,
      'contractor_name': instance.contractor,
      'skill_type': instance.skillType,
      'daily_wages': instance.dailyWages,
      'contract_employee_name': instance.contractEmployee,
      'gender': instance.gender,
      'aadhaar': instance.aadhaar,
      'dob': instance.dob,
      'pf': instance.pf,
      'esi': instance.esi,
      'photo': instance.photo,
    };
