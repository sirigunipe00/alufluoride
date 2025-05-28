// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_order_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PurchaseOrderFormImpl _$$PurchaseOrderFormImplFromJson(
        Map<String, dynamic> json) =>
    _$PurchaseOrderFormImpl(
      name: json['name'] as String?,
      creationDate: json['creation'] as String? ?? '',
      supplier: json['supplier'] as String?,
      status: json['status'] as String?,
      modified: json['modified'] as String?,
    );

Map<String, dynamic> _$$PurchaseOrderFormImplToJson(
        _$PurchaseOrderFormImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'creation': instance.creationDate,
      'supplier': instance.supplier,
      'status': instance.status,
      'modified': instance.modified,
    };
