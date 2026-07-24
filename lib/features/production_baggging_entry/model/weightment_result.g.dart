// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weightment_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WeightmentResultImpl _$$WeightmentResultImplFromJson(
        Map<String, dynamic> json) =>
    _$WeightmentResultImpl(
      weight: json['weight'] as String?,
      rejectReason: json['rejection_reason'] as String?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$WeightmentResultImplToJson(
        _$WeightmentResultImpl instance) =>
    <String, dynamic>{
      'weight': instance.weight,
      'rejection_reason': instance.rejectReason,
      'message': instance.message,
    };
