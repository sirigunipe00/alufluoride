// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_request_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VehcileRequestFormImpl _$$VehcileRequestFormImplFromJson(
        Map<String, dynamic> json) =>
    _$VehcileRequestFormImpl(
      status: json['status'] as String?,
      name: json['name'] as String?,
      creationDate: json['creation'] as String? ?? '',
      workFlowState: json['workflow_state'] as String?,
      vehicleType: json['vehicle_type'] as String?,
      date: json['date'] as String?,
      inTime: json['in_time'] as String?,
      outTime: json['out_time'] as String?,
    );

Map<String, dynamic> _$$VehcileRequestFormImplToJson(
        _$VehcileRequestFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'name': instance.name,
      'creation': instance.creationDate,
      'workflow_state': instance.workFlowState,
      'vehicle_type': instance.vehicleType,
      'date': instance.date,
      'in_time': instance.inTime,
      'out_time': instance.outTime,
    };
