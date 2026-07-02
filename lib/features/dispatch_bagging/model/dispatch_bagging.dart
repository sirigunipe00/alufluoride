import 'package:freezed_annotation/freezed_annotation.dart';

part 'dispatch_bagging.freezed.dart';
part 'dispatch_bagging.g.dart';

@freezed
class DispatchBaggingModel with _$DispatchBaggingModel {
  const factory DispatchBaggingModel({
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
    @JsonKey(name: 'posting_date') String? postingDate,
    @JsonKey(name: 'batch') String? batch,
    @JsonKey(name: 'amended_from') String? amendedFrom,
    @JsonKey(name: 'uom') String? uom,
    @JsonKey(name: 'fg_item') String? fgItem,
    @JsonKey(name: 'quality_inspection') String? qualityInspection,
    @JsonKey(name: 'total_qty') double? totalQty,
    @JsonKey(name: 'is_consumption_created') int? isConsumptionCreated,
    @JsonKey(name: 'is_fg_created') int? isFgCreated,
    @JsonKey(name: 'production_entry') String? productionEntry,
    @JsonKey(name: 'customer_name') String? customerName,
  }) = _DispatchBaggingModel;
  factory DispatchBaggingModel.fromJson(Map<String, dynamic> json) =>
      _$DispatchBaggingModelFromJson(json);
}
