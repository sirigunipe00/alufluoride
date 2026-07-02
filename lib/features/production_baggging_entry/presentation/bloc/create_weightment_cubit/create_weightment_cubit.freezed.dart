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
  File? get watermarkedImage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeightmentStateCopyWith<WeightmentState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeightmentStateCopyWith<$Res> {
  factory $WeightmentStateCopyWith(
          WeightmentState value, $Res Function(WeightmentState) then) =
      _$WeightmentStateCopyWithImpl<$Res, WeightmentState>;
  @useResult
  $Res call(
      {bool isExtracting,
      String? extractedWeight,
      Failure? error,
      File? watermarkedImage});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExtracting = null,
    Object? extractedWeight = freezed,
    Object? error = freezed,
    Object? watermarkedImage = freezed,
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
      watermarkedImage: freezed == watermarkedImage
          ? _value.watermarkedImage
          : watermarkedImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }

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
  $Res call(
      {bool isExtracting,
      String? extractedWeight,
      Failure? error,
      File? watermarkedImage});

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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isExtracting = null,
    Object? extractedWeight = freezed,
    Object? error = freezed,
    Object? watermarkedImage = freezed,
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
      watermarkedImage: freezed == watermarkedImage
          ? _value.watermarkedImage
          : watermarkedImage // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$WeightmentStateImpl
    with DiagnosticableTreeMixin
    implements _WeightmentState {
  const _$WeightmentStateImpl(
      {required this.isExtracting,
      this.extractedWeight,
      this.error,
      this.watermarkedImage});

  @override
  final bool isExtracting;
  @override
  final String? extractedWeight;
  @override
  final Failure? error;
  @override
  final File? watermarkedImage;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeightmentState(isExtracting: $isExtracting, extractedWeight: $extractedWeight, error: $error, watermarkedImage: $watermarkedImage)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeightmentState'))
      ..add(DiagnosticsProperty('isExtracting', isExtracting))
      ..add(DiagnosticsProperty('extractedWeight', extractedWeight))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('watermarkedImage', watermarkedImage));
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
            (identical(other.error, error) || other.error == error) &&
            (identical(other.watermarkedImage, watermarkedImage) ||
                other.watermarkedImage == watermarkedImage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isExtracting, extractedWeight, error, watermarkedImage);

  @JsonKey(ignore: true)
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
      final Failure? error,
      final File? watermarkedImage}) = _$WeightmentStateImpl;

  @override
  bool get isExtracting;
  @override
  String? get extractedWeight;
  @override
  Failure? get error;
  @override
  File? get watermarkedImage;
  @override
  @JsonKey(ignore: true)
  _$$WeightmentStateImplCopyWith<_$WeightmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
