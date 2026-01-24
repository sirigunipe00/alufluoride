import 'package:freezed_annotation/freezed_annotation.dart';


part 'weightment_result.freezed.dart';
part 'weightment_result.g.dart';

@freezed
class WeightmentResult with _$WeightmentResult {
  const factory WeightmentResult({
    @JsonKey(name: 'weight') String? weight,
  }) = _WeightmentResult;
factory WeightmentResult.fromJson(Map<String, dynamic> json) => _$WeightmentResultFromJson(json);
}