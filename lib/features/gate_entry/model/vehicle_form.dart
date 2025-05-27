import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle_form.freezed.dart';
part 'vehicle_form.g.dart';

@freezed
class VehcileForm with _$VehcileForm {
  const factory VehcileForm({
    String? status,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
    @JsonKey(name: 'license_plate') String? licenseplate,
    @JsonKey(name: 'make') String? make,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'last_odometer') int? lastodometer,
    @JsonKey(name: 'fuel_type') String? fuelType,
    @JsonKey(name: 'uom') String? uom,
  }) = _VehcileForm;

  factory VehcileForm.fromJson(Map<String, dynamic> json) =>
      _$VehcileFormFromJson(json);

        static List<String> fields = ['name'];
}

dynamic toNull(_) => null;
