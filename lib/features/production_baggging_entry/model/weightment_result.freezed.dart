// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weightment_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WeightmentResult _$WeightmentResultFromJson(Map<String, dynamic> json) {
  return _WeightmentResult.fromJson(json);
}

/// @nodoc
mixin _$WeightmentResult {
  @JsonKey(name: 'weight')
  String? get weight => throw _privateConstructorUsedError;

  /// Serializes this WeightmentResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WeightmentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeightmentResultCopyWith<WeightmentResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightmentResultCopyWith<$Res> {
  factory $WeightmentResultCopyWith(
          WeightmentResult value, $Res Function(WeightmentResult) then) =
      _$WeightmentResultCopyWithImpl<$Res, WeightmentResult>;
  @useResult
  $Res call({@JsonKey(name: 'weight') String? weight});
}

/// @nodoc
class _$WeightmentResultCopyWithImpl<$Res, $Val extends WeightmentResult>
    implements $WeightmentResultCopyWith<$Res> {
  _$WeightmentResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeightmentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
  }) {
    return _then(_value.copyWith(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WeightmentResultImplCopyWith<$Res>
    implements $WeightmentResultCopyWith<$Res> {
  factory _$$WeightmentResultImplCopyWith(_$WeightmentResultImpl value,
          $Res Function(_$WeightmentResultImpl) then) =
      __$$WeightmentResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'weight') String? weight});
}

/// @nodoc
class __$$WeightmentResultImplCopyWithImpl<$Res>
    extends _$WeightmentResultCopyWithImpl<$Res, _$WeightmentResultImpl>
    implements _$$WeightmentResultImplCopyWith<$Res> {
  __$$WeightmentResultImplCopyWithImpl(_$WeightmentResultImpl _value,
      $Res Function(_$WeightmentResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeightmentResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
  }) {
    return _then(_$WeightmentResultImpl(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WeightmentResultImpl implements _WeightmentResult {
  const _$WeightmentResultImpl({@JsonKey(name: 'weight') this.weight});

  factory _$WeightmentResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$WeightmentResultImplFromJson(json);

  @override
  @JsonKey(name: 'weight')
  final String? weight;

  @override
  String toString() {
    return 'WeightmentResult(weight: $weight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightmentResultImpl &&
            (identical(other.weight, weight) || other.weight == weight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, weight);

  /// Create a copy of WeightmentResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightmentResultImplCopyWith<_$WeightmentResultImpl> get copyWith =>
      __$$WeightmentResultImplCopyWithImpl<_$WeightmentResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WeightmentResultImplToJson(
      this,
    );
  }
}

abstract class _WeightmentResult implements WeightmentResult {
  const factory _WeightmentResult(
      {@JsonKey(name: 'weight') final String? weight}) = _$WeightmentResultImpl;

  factory _WeightmentResult.fromJson(Map<String, dynamic> json) =
      _$WeightmentResultImpl.fromJson;

  @override
  @JsonKey(name: 'weight')
  String? get weight;

  /// Create a copy of WeightmentResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightmentResultImplCopyWith<_$WeightmentResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
