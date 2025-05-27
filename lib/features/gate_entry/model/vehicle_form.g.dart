// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehcileFormImpl _$$VehcileFormImplFromJson(Map<String, dynamic> json) =>
    _$VehcileFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      creationDate: json['creation'] as String? ?? '',
      licenseplate: json['license_plate'] as String?,
      make: json['make'] as String?,
      model: json['model'] as String?,
      lastodometer: (json['last_odometer'] as num?)?.toInt(),
      fuelType: json['fuel_type'] as String?,
      uom: json['uom'] as String?,
    );

Map<String, dynamic> _$$VehcileFormImplToJson(_$VehcileFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'creation': instance.creationDate,
      'license_plate': instance.licenseplate,
      'make': instance.make,
      'model': instance.model,
      'last_odometer': instance.lastodometer,
      'fuel_type': instance.fuelType,
      'uom': instance.uom,
    };
