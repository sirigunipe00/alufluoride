import 'package:freezed_annotation/freezed_annotation.dart';

part 'bagging_entry_model.freezed.dart';
part 'bagging_entry_model.g.dart';

@freezed
class BaggingEntryModel with _$BaggingEntryModel {
  const factory BaggingEntryModel({
    String? status,

    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'owner') String? owner,
    @JsonKey(name: 'creation') String? creation,
    @JsonKey(name: 'modified') String? modified,
    @JsonKey(name: 'modified_by') String? modifiedBy,
    @JsonKey(name: 'docstatus') int? docstatus,
    @JsonKey(name: 'idx') int? idx,
    @JsonKey(name: 'company') String? company,
    @JsonKey(name: 'shift') String? shift,
    @JsonKey(name: 'production_date') String? productionDate,
    @JsonKey(name: 'batch') String? batch,
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'uom') String? uom,
    @JsonKey(name: 'production_type') String? productionType,
    @JsonKey(name: 'fg_item') String? fgItem,
    @JsonKey(name: 'quality_inspection') String? qualityInspection,
    @JsonKey(name: 'total_batch_qty') double? totalBatchQty,
    @JsonKey(name: 'is_consumption_created') int? isConsumptionCreated,
    @JsonKey(name: 'is_fg_created') int? isFgCreated,
    @JsonKey(name: 'production_entry') String? productionEntry,
  }) = _BaggingEntryModel;
  factory BaggingEntryModel.fromJson(Map<String, dynamic> json) =>
      _$BaggingEntryModelFromJson(json);
}
