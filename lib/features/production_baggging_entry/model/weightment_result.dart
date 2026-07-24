import 'package:freezed_annotation/freezed_annotation.dart';


part 'weightment_result.freezed.dart';
part 'weightment_result.g.dart';

@freezed
class WeightmentResult with _$WeightmentResult {
  const factory WeightmentResult({
    @JsonKey(name: 'weight') String? weight,
    @JsonKey(name: 'rejection_reason') String? rejectReason,
    @JsonKey(name: 'message') String? message, 
  }) = _WeightmentResult;
factory WeightmentResult.fromJson(Map<String, dynamic> json) => _$WeightmentResultFromJson(json);
}