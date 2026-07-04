// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bag_tracking_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BagTrackingItemsImpl _$$BagTrackingItemsImplFromJson(
        Map<String, dynamic> json) =>
    _$BagTrackingItemsImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      batchNo: json['batch_no'] as String?,
      bagWeight: (json['bag_weight_mt'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BagTrackingItemsImplToJson(
        _$BagTrackingItemsImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creation,
      'modified': instance.modified,
      'modified_by': instance.modifiedBy,
      'batch_no': instance.batchNo,
      'bag_weight_mt': instance.bagWeight,
    };
