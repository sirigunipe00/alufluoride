// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_weightment_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeightmentState {
  bool get isExtracting => throw _privateConstructorUsedError;
  String? get extractedWeight => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  /// Create a copy of WeightmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeightmentStateCopyWith<WeightmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightmentStateCopyWith<$Res> {
  factory $WeightmentStateCopyWith(
          WeightmentState value, $Res Function(WeightmentState) then) =
      _$WeightmentStateCopyWithImpl<$Res, WeightmentState>;
  @useResult
  $Res call({bool isExtracting, String? extractedWeight, Failure? error});

  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$WeightmentStateCopyWithImpl<$Res, $Val extends WeightmentState>
    implements $WeightmentStateCopyWith<$Res> {
  _$WeightmentStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeightmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExtracting = null,
    Object? extractedWeight = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isExtracting: null == isExtracting
          ? _value.isExtracting
          : isExtracting // ignore: cast_nullable_to_non_nullable
              as bool,
      extractedWeight: freezed == extractedWeight
          ? _value.extractedWeight
          : extractedWeight // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  /// Create a copy of WeightmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$WeightmentStateImplCopyWith<$Res>
    implements $WeightmentStateCopyWith<$Res> {
  factory _$$WeightmentStateImplCopyWith(_$WeightmentStateImpl value,
          $Res Function(_$WeightmentStateImpl) then) =
      __$$WeightmentStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isExtracting, String? extractedWeight, Failure? error});

  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$WeightmentStateImplCopyWithImpl<$Res>
    extends _$WeightmentStateCopyWithImpl<$Res, _$WeightmentStateImpl>
    implements _$$WeightmentStateImplCopyWith<$Res> {
  __$$WeightmentStateImplCopyWithImpl(
      _$WeightmentStateImpl _value, $Res Function(_$WeightmentStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeightmentState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExtracting = null,
    Object? extractedWeight = freezed,
    Object? error = freezed,
  }) {
    return _then(_$WeightmentStateImpl(
      isExtracting: null == isExtracting
          ? _value.isExtracting
          : isExtracting // ignore: cast_nullable_to_non_nullable
              as bool,
      extractedWeight: freezed == extractedWeight
          ? _value.extractedWeight
          : extractedWeight // ignore: cast_nullable_to_non_nullable
              as String?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$WeightmentStateImpl implements _WeightmentState {
  const _$WeightmentStateImpl(
      {required this.isExtracting, this.extractedWeight, this.error});

  @override
  final bool isExtracting;
  @override
  final String? extractedWeight;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'WeightmentState(isExtracting: $isExtracting, extractedWeight: $extractedWeight, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightmentStateImpl &&
            (identical(other.isExtracting, isExtracting) ||
                other.isExtracting == isExtracting) &&
            (identical(other.extractedWeight, extractedWeight) ||
                other.extractedWeight == extractedWeight) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isExtracting, extractedWeight, error);

  /// Create a copy of WeightmentState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeightmentStateImplCopyWith<_$WeightmentStateImpl> get copyWith =>
      __$$WeightmentStateImplCopyWithImpl<_$WeightmentStateImpl>(
          this, _$identity);
}

abstract class _WeightmentState implements WeightmentState {
  const factory _WeightmentState(
      {required final bool isExtracting,
      final String? extractedWeight,
      final Failure? error}) = _$WeightmentStateImpl;

  @override
  bool get isExtracting;
  @override
  String? get extractedWeight;
  @override
  Failure? get error;

  /// Create a copy of WeightmentState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeightmentStateImplCopyWith<_$WeightmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
