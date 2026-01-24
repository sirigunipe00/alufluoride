// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bagging_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BaggingEntryModelImpl _$$BaggingEntryModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BaggingEntryModelImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      owner: json['owner'] as String?,
      creation: json['creation'] as String?,
      modified: json['modified'] as String?,
      modifiedBy: json['modified_by'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      idx: (json['idx'] as num?)?.toInt(),
      company: json['company'] as String?,
      shift: json['shift'] as String?,
      productionDate: json['production_date'] as String?,
      batch: json['batch'] as String?,
      amendedFrom: json['amended_from'] as String?,
      uom: json['uom'] as String?,
      fgItem: json['fg_item'] as String?,
      qualityInspection: json['quality_inspection'] as String?,
      totalBatchQty: (json['total_batch_qty'] as num?)?.toDouble(),
      isConsumptionCreated: (json['is_consumption_created'] as num?)?.toInt(),
      isFgCreated: (json['is_fg_created'] as num?)?.toInt(),
      productionEntry: json['production_entry'] as String?,
    );

Map<String, dynamic> _$$BaggingEntryModelImplToJson(
        _$BaggingEntryModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'owner': instance.owner,
      'creation': instance.creation,
      'modified': instance.modified,
      'modified_by': instance.modifiedBy,
      'docstatus': instance.docstatus,
      'idx': instance.idx,
      'company': instance.company,
      'shift': instance.shift,
      'production_date': instance.productionDate,
      'batch': instance.batch,
      'amended_from': instance.amendedFrom,
      'uom': instance.uom,
      'fg_item': instance.fgItem,
      'quality_inspection': instance.qualityInspection,
      'total_batch_qty': instance.totalBatchQty,
      'is_consumption_created': instance.isConsumptionCreated,
      'is_fg_created': instance.isFgCreated,
      'production_entry': instance.productionEntry,
    };
