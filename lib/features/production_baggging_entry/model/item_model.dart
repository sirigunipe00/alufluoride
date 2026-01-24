import 'dart:io';

import 'package:alufluoride/features/gate_entry/model/gate_entry_form.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_model.freezed.dart';
part 'item_model.g.dart';

@freezed
class ItemModel with _$ItemModel {
  const factory ItemModel({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'modified') String? modified,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'parent') String? parent,
    @JsonKey(name: 'parentfield') String? parentfield,
    @JsonKey(name: 'parenttype') String? parenttype,
    @JsonKey(name: 'bag_no') String? bagNo,
    @JsonKey(name: 'qty') double? qty,
    @JsonKey(name: 'serial_no') String? serialNo,
    @JsonKey(name: 'sticker_printed') int? stickerPrinted,
    @JsonKey(name: 'weighing_scale') String? weighingScale,
     @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull,
    )
    File? imageFile,
  }) = _ItemModel;

  factory ItemModel.fromJson(Map<String, dynamic> json) => _$ItemModelFromJson(json);
}