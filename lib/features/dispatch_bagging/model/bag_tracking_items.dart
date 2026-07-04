import 'package:freezed_annotation/freezed_annotation.dart';
part 'bag_tracking_items.freezed.dart';
part 'bag_tracking_items.g.dart';

@freezed
class BagTrackingItems with _$BagTrackingItems {
  const factory BagTrackingItems({
    String? status,

    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'modified') String? modified,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'batch_no') String? batchNo,
    @JsonKey(name: 'bag_weight_mt') double? bagWeight,
  }) = _BagTrackingItems;
  factory BagTrackingItems.fromJson(Map<String, dynamic> json) =>
      _$BagTrackingItemsFromJson(json);
}