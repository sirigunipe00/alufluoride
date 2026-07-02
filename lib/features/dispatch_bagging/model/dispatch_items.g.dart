// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dispatch_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DispatchItemsModelImpl _$$DispatchItemsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$DispatchItemsModelImpl(
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      idx: (json['idx'] as num?)?.toInt(),
      parent: json['parent'] as String?,
      parentfield: json['parentfield'] as String?,
      parenttype: json['parenttype'] as String?,
      amendedFrom: json['amended_from'] as String?,
      bagNo: json['bag_no'] as String?,
      bagWeight: (json['bag_weight'] as num?)?.toDouble(),
      batch: json['batch'] as String?,
      status: json['status'] as String?,
      itemCode: json['item_code'] as String?,
    );

Map<String, dynamic> _$$DispatchItemsModelImplToJson(
        _$DispatchItemsModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creation,
      'modified': instance.modified,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'idx': instance.idx,
      'parent': instance.parent,
      'parentfield': instance.parentfield,
      'parenttype': instance.parenttype,
      'amended_from': instance.amendedFrom,
      'bag_no': instance.bagNo,
      'bag_weight': instance.bagWeight,
      'batch': instance.batch,
      'status': instance.status,
      'item_code': instance.itemCode,
    };
