// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemModelImpl _$$ItemModelImplFromJson(Map<String, dynamic> json) =>
    _$ItemModelImpl(
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
      bagNo: json['bag_no'] as String?,
      palletWeight: (json['pallet_weight'] as num?)?.toDouble(),
      qty: (json['qty'] as num?)?.toDouble(),
      actualBagWeight: (json['actual_bag_weight'] as num?)?.toDouble(),
      serialNo: json['serial_no'] as String?,
      stickerPrinted: (json['sticker_printed'] as num?)?.toInt(),
      weightOfPalletandBag:
          (json['weight_of_pallet_and_bag'] as num?)?.toDouble(),
      emptyPalletImage: json['empty_pallet_and_bag_photo'] as String?,
      emptyWeightFile: toNull(json['emptyWeightFile']),
      weighingScale: json['weighing_scale'] as String?,
      imageFile: toNull(json['imageFile']),
    );

Map<String, dynamic> _$$ItemModelImplToJson(_$ItemModelImpl instance) =>
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
      'bag_no': instance.bagNo,
      'pallet_weight': instance.palletWeight,
      'qty': instance.qty,
      'actual_bag_weight': instance.actualBagWeight,
      'serial_no': instance.serialNo,
      'sticker_printed': instance.stickerPrinted,
      'weight_of_pallet_and_bag': instance.weightOfPalletandBag,
      'empty_pallet_and_bag_photo': instance.emptyPalletImage,
      'weighing_scale': instance.weighingScale,
    };
