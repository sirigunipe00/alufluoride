import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispatch_items.freezed.dart';
part 'dispatch_items.g.dart';

@freezed
class DispatchItemsModel with _$DispatchItemsModel {
  const factory DispatchItemsModel({

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
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'bag_no') String? bagNo,
    @JsonKey(name: 'bag_weight') double? bagWeight,
    @JsonKey(name: 'batch') String? batch,
    @JsonKey(name: 'status') String? status,
    @JsonKey(name: 'item_code') String? itemCode,
  }) = _DispatchItemsModel;
  factory DispatchItemsModel.fromJson(Map<String, dynamic> json) =>
      _$DispatchItemsModelFromJson(json);
}
