
import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_request_form.freezed.dart';
part 'vehicle_request_form.g.dart';

@freezed
class VehcileRequestForm with _$VehcileRequestForm {
  const factory VehcileRequestForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'workflow_state') String? workFlowState,
    @JsonKey(name: 'vehicle_type') String? vehicleType,
    @JsonKey(name: 'date') String? date,
    @JsonKey(name: 'in_time') String? inTime,
    @JsonKey(name: 'out_time') String? outTime,
  }) = _VehcileRequestForm;

  factory VehcileRequestForm.fromJson(Map<String, dynamic> json) =>
      _$VehcileRequestFormFromJson(json);

        static List<String> fields = ['name'];
}

dynamic toNull(_) => null;
