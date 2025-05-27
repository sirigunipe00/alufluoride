// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

VehcileForm _$VehcileFormFromJson(Map<String, dynamic> json) {
  return _VehcileForm.fromJson(json);
}

/// @nodoc
mixin _$VehcileForm {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'license_plate')
  String? get licenseplate => throw _privateConstructorUsedError;
  @JsonKey(name: 'make')
  String? get make => throw _privateConstructorUsedError;
  @JsonKey(name: 'model')
  String? get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_odometer')
  int? get lastodometer => throw _privateConstructorUsedError;
  @JsonKey(name: 'fuel_type')
  String? get fuelType => throw _privateConstructorUsedError;
  @JsonKey(name: 'uom')
  String? get uom => throw _privateConstructorUsedError;

  /// Serializes this VehcileForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of VehcileForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VehcileFormCopyWith<VehcileForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VehcileFormCopyWith<$Res> {
  factory $VehcileFormCopyWith(
          VehcileForm value, $Res Function(VehcileForm) then) =
      _$VehcileFormCopyWithImpl<$Res, VehcileForm>;
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
      @JsonKey(name: 'license_plate') String? licenseplate,
      @JsonKey(name: 'make') String? make,
      @JsonKey(name: 'model') String? model,
      @JsonKey(name: 'last_odometer') int? lastodometer,
      @JsonKey(name: 'fuel_type') String? fuelType,
      @JsonKey(name: 'uom') String? uom});
}

/// @nodoc
class _$VehcileFormCopyWithImpl<$Res, $Val extends VehcileForm>
    implements $VehcileFormCopyWith<$Res> {
  _$VehcileFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VehcileForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? creationDate = freezed,
    Object? licenseplate = freezed,
    Object? make = freezed,
    Object? model = freezed,
    Object? lastodometer = freezed,
    Object? fuelType = freezed,
    Object? uom = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseplate: freezed == licenseplate
          ? _value.licenseplate
          : licenseplate // ignore: cast_nullable_to_non_nullable
              as String?,
      make: freezed == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      lastodometer: freezed == lastodometer
          ? _value.lastodometer
          : lastodometer // ignore: cast_nullable_to_non_nullable
              as int?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as String?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VehcileFormImplCopyWith<$Res>
    implements $VehcileFormCopyWith<$Res> {
  factory _$$VehcileFormImplCopyWith(
          _$VehcileFormImpl value, $Res Function(_$VehcileFormImpl) then) =
      __$$VehcileFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
      @JsonKey(name: 'license_plate') String? licenseplate,
      @JsonKey(name: 'make') String? make,
      @JsonKey(name: 'model') String? model,
      @JsonKey(name: 'last_odometer') int? lastodometer,
      @JsonKey(name: 'fuel_type') String? fuelType,
      @JsonKey(name: 'uom') String? uom});
}

/// @nodoc
class __$$VehcileFormImplCopyWithImpl<$Res>
    extends _$VehcileFormCopyWithImpl<$Res, _$VehcileFormImpl>
    implements _$$VehcileFormImplCopyWith<$Res> {
  __$$VehcileFormImplCopyWithImpl(
      _$VehcileFormImpl _value, $Res Function(_$VehcileFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of VehcileForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? creationDate = freezed,
    Object? licenseplate = freezed,
    Object? make = freezed,
    Object? model = freezed,
    Object? lastodometer = freezed,
    Object? fuelType = freezed,
    Object? uom = freezed,
  }) {
    return _then(_$VehcileFormImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      licenseplate: freezed == licenseplate
          ? _value.licenseplate
          : licenseplate // ignore: cast_nullable_to_non_nullable
              as String?,
      make: freezed == make
          ? _value.make
          : make // ignore: cast_nullable_to_non_nullable
              as String?,
      model: freezed == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String?,
      lastodometer: freezed == lastodometer
          ? _value.lastodometer
          : lastodometer // ignore: cast_nullable_to_non_nullable
              as int?,
      fuelType: freezed == fuelType
          ? _value.fuelType
          : fuelType // ignore: cast_nullable_to_non_nullable
              as String?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VehcileFormImpl implements _VehcileForm {
  const _$VehcileFormImpl(
      {this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'creation', defaultValue: '') this.creationDate,
      @JsonKey(name: 'license_plate') this.licenseplate,
      @JsonKey(name: 'make') this.make,
      @JsonKey(name: 'model') this.model,
      @JsonKey(name: 'last_odometer') this.lastodometer,
      @JsonKey(name: 'fuel_type') this.fuelType,
      @JsonKey(name: 'uom') this.uom});

  factory _$VehcileFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$VehcileFormImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  final String? creationDate;
  @override
  @JsonKey(name: 'license_plate')
  final String? licenseplate;
  @override
  @JsonKey(name: 'make')
  final String? make;
  @override
  @JsonKey(name: 'model')
  final String? model;
  @override
  @JsonKey(name: 'last_odometer')
  final int? lastodometer;
  @override
  @JsonKey(name: 'fuel_type')
  final String? fuelType;
  @override
  @JsonKey(name: 'uom')
  final String? uom;

  @override
  String toString() {
    return 'VehcileForm(status: $status, name: $name, creationDate: $creationDate, licenseplate: $licenseplate, make: $make, model: $model, lastodometer: $lastodometer, fuelType: $fuelType, uom: $uom)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VehcileFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.licenseplate, licenseplate) ||
                other.licenseplate == licenseplate) &&
            (identical(other.make, make) || other.make == make) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.lastodometer, lastodometer) ||
                other.lastodometer == lastodometer) &&
            (identical(other.fuelType, fuelType) ||
                other.fuelType == fuelType) &&
            (identical(other.uom, uom) || other.uom == uom));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, status, name, creationDate,
      licenseplate, make, model, lastodometer, fuelType, uom);

  /// Create a copy of VehcileForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VehcileFormImplCopyWith<_$VehcileFormImpl> get copyWith =>
      __$$VehcileFormImplCopyWithImpl<_$VehcileFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VehcileFormImplToJson(
      this,
    );
  }
}

abstract class _VehcileForm implements VehcileForm {
  const factory _VehcileForm(
      {final String? status,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'creation', defaultValue: '') final String? creationDate,
      @JsonKey(name: 'license_plate') final String? licenseplate,
      @JsonKey(name: 'make') final String? make,
      @JsonKey(name: 'model') final String? model,
      @JsonKey(name: 'last_odometer') final int? lastodometer,
      @JsonKey(name: 'fuel_type') final String? fuelType,
      @JsonKey(name: 'uom') final String? uom}) = _$VehcileFormImpl;

  factory _VehcileForm.fromJson(Map<String, dynamic> json) =
      _$VehcileFormImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate;
  @override
  @JsonKey(name: 'license_plate')
  String? get licenseplate;
  @override
  @JsonKey(name: 'make')
  String? get make;
  @override
  @JsonKey(name: 'model')
  String? get model;
  @override
  @JsonKey(name: 'last_odometer')
  int? get lastodometer;
  @override
  @JsonKey(name: 'fuel_type')
  String? get fuelType;
  @override
  @JsonKey(name: 'uom')
  String? get uom;

  /// Create a copy of VehcileForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VehcileFormImplCopyWith<_$VehcileFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
