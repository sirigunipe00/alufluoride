// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contractors_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContractorsFormImpl _$$ContractorsFormImplFromJson(
        Map<String, dynamic> json) =>
    _$ContractorsFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      supplierGroup: json['supplier_group'] as String?,
      supplierType: json['supplier_type'] as String?,
      isContractor: (json['custom_is_contractor'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ContractorsFormImplToJson(
        _$ContractorsFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'supplier_group': instance.supplierGroup,
      'supplier_type': instance.supplierType,
      'custom_is_contractor': instance.isContractor,
    };
