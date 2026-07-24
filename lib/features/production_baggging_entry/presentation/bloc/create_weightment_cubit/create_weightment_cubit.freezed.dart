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
  double? get emptyWeight => throw _privateConstructorUsedError;
  File? get emptyImage => throw _privateConstructorUsedError;
  double? get finalWeight => throw _privateConstructorUsedError;
  File? get filledImage => throw _privateConstructorUsedError;
  int? get activeLineIndex => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

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
      double? emptyWeight,
      File? emptyImage,
      double? finalWeight,
      File? filledImage,
      int? activeLineIndex,
      Failure? error});

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
    Object? emptyWeight = freezed,
    Object? emptyImage = freezed,
    Object? finalWeight = freezed,
    Object? filledImage = freezed,
    Object? activeLineIndex = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      isExtracting: null == isExtracting
          ? _value.isExtracting
          : isExtracting // ignore: cast_nullable_to_non_nullable
              as bool,
      emptyWeight: freezed == emptyWeight
          ? _value.emptyWeight
          : emptyWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      emptyImage: freezed == emptyImage
          ? _value.emptyImage
          : emptyImage // ignore: cast_nullable_to_non_nullable
              as File?,
      finalWeight: freezed == finalWeight
          ? _value.finalWeight
          : finalWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      filledImage: freezed == filledImage
          ? _value.filledImage
          : filledImage // ignore: cast_nullable_to_non_nullable
              as File?,
      activeLineIndex: freezed == activeLineIndex
          ? _value.activeLineIndex
          : activeLineIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
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
      double? emptyWeight,
      File? emptyImage,
      double? finalWeight,
      File? filledImage,
      int? activeLineIndex,
      Failure? error});

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
    Object? emptyWeight = freezed,
    Object? emptyImage = freezed,
    Object? finalWeight = freezed,
    Object? filledImage = freezed,
    Object? activeLineIndex = freezed,
    Object? error = freezed,
  }) {
    return _then(_$WeightmentStateImpl(
      isExtracting: null == isExtracting
          ? _value.isExtracting
          : isExtracting // ignore: cast_nullable_to_non_nullable
              as bool,
      emptyWeight: freezed == emptyWeight
          ? _value.emptyWeight
          : emptyWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      emptyImage: freezed == emptyImage
          ? _value.emptyImage
          : emptyImage // ignore: cast_nullable_to_non_nullable
              as File?,
      finalWeight: freezed == finalWeight
          ? _value.finalWeight
          : finalWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      filledImage: freezed == filledImage
          ? _value.filledImage
          : filledImage // ignore: cast_nullable_to_non_nullable
              as File?,
      activeLineIndex: freezed == activeLineIndex
          ? _value.activeLineIndex
          : activeLineIndex // ignore: cast_nullable_to_non_nullable
              as int?,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$WeightmentStateImpl
    with DiagnosticableTreeMixin
    implements _WeightmentState {
  const _$WeightmentStateImpl(
      {required this.isExtracting,
      this.emptyWeight,
      this.emptyImage,
      this.finalWeight,
      this.filledImage,
      this.activeLineIndex,
      this.error});

  @override
  final bool isExtracting;
  @override
  final double? emptyWeight;
  @override
  final File? emptyImage;
  @override
  final double? finalWeight;
  @override
  final File? filledImage;
  @override
  final int? activeLineIndex;
  @override
  final Failure? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'WeightmentState(isExtracting: $isExtracting, emptyWeight: $emptyWeight, emptyImage: $emptyImage, finalWeight: $finalWeight, filledImage: $filledImage, activeLineIndex: $activeLineIndex, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeightmentState'))
      ..add(DiagnosticsProperty('isExtracting', isExtracting))
      ..add(DiagnosticsProperty('emptyWeight', emptyWeight))
      ..add(DiagnosticsProperty('emptyImage', emptyImage))
      ..add(DiagnosticsProperty('finalWeight', finalWeight))
      ..add(DiagnosticsProperty('filledImage', filledImage))
      ..add(DiagnosticsProperty('activeLineIndex', activeLineIndex))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeightmentStateImpl &&
            (identical(other.isExtracting, isExtracting) ||
                other.isExtracting == isExtracting) &&
            (identical(other.emptyWeight, emptyWeight) ||
                other.emptyWeight == emptyWeight) &&
            (identical(other.emptyImage, emptyImage) ||
                other.emptyImage == emptyImage) &&
            (identical(other.finalWeight, finalWeight) ||
                other.finalWeight == finalWeight) &&
            (identical(other.filledImage, filledImage) ||
                other.filledImage == filledImage) &&
            (identical(other.activeLineIndex, activeLineIndex) ||
                other.activeLineIndex == activeLineIndex) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isExtracting, emptyWeight,
      emptyImage, finalWeight, filledImage, activeLineIndex, error);

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
      final double? emptyWeight,
      final File? emptyImage,
      final double? finalWeight,
      final File? filledImage,
      final int? activeLineIndex,
      final Failure? error}) = _$WeightmentStateImpl;

  @override
  bool get isExtracting;
  @override
  double? get emptyWeight;
  @override
  File? get emptyImage;
  @override
  double? get finalWeight;
  @override
  File? get filledImage;
  @override
  int? get activeLineIndex;
  @override
  Failure? get error;
  @override
  @JsonKey(ignore: true)
  _$$WeightmentStateImplCopyWith<_$WeightmentStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
