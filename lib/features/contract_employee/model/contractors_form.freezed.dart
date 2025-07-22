// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'contractors_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ContractorsForm _$ContractorsFormFromJson(Map<String, dynamic> json) {
  return _ContractorsForm.fromJson(json);
}

/// @nodoc
mixin _$ContractorsForm {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_group')
  String? get supplierGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier_type')
  String? get supplierType => throw _privateConstructorUsedError;
  @JsonKey(name: 'custom_is_contractor')
  int? get isContractor => throw _privateConstructorUsedError;

  /// Serializes this ContractorsForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContractorsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContractorsFormCopyWith<ContractorsForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContractorsFormCopyWith<$Res> {
  factory $ContractorsFormCopyWith(
          ContractorsForm value, $Res Function(ContractorsForm) then) =
      _$ContractorsFormCopyWithImpl<$Res, ContractorsForm>;
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'supplier_group') String? supplierGroup,
      @JsonKey(name: 'supplier_type') String? supplierType,
      @JsonKey(name: 'custom_is_contractor') int? isContractor});
}

/// @nodoc
class _$ContractorsFormCopyWithImpl<$Res, $Val extends ContractorsForm>
    implements $ContractorsFormCopyWith<$Res> {
  _$ContractorsFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContractorsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? supplierGroup = freezed,
    Object? supplierType = freezed,
    Object? isContractor = freezed,
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
      supplierGroup: freezed == supplierGroup
          ? _value.supplierGroup
          : supplierGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierType: freezed == supplierType
          ? _value.supplierType
          : supplierType // ignore: cast_nullable_to_non_nullable
              as String?,
      isContractor: freezed == isContractor
          ? _value.isContractor
          : isContractor // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContractorsFormImplCopyWith<$Res>
    implements $ContractorsFormCopyWith<$Res> {
  factory _$$ContractorsFormImplCopyWith(_$ContractorsFormImpl value,
          $Res Function(_$ContractorsFormImpl) then) =
      __$$ContractorsFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'supplier_group') String? supplierGroup,
      @JsonKey(name: 'supplier_type') String? supplierType,
      @JsonKey(name: 'custom_is_contractor') int? isContractor});
}

/// @nodoc
class __$$ContractorsFormImplCopyWithImpl<$Res>
    extends _$ContractorsFormCopyWithImpl<$Res, _$ContractorsFormImpl>
    implements _$$ContractorsFormImplCopyWith<$Res> {
  __$$ContractorsFormImplCopyWithImpl(
      _$ContractorsFormImpl _value, $Res Function(_$ContractorsFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContractorsForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? supplierGroup = freezed,
    Object? supplierType = freezed,
    Object? isContractor = freezed,
  }) {
    return _then(_$ContractorsFormImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierGroup: freezed == supplierGroup
          ? _value.supplierGroup
          : supplierGroup // ignore: cast_nullable_to_non_nullable
              as String?,
      supplierType: freezed == supplierType
          ? _value.supplierType
          : supplierType // ignore: cast_nullable_to_non_nullable
              as String?,
      isContractor: freezed == isContractor
          ? _value.isContractor
          : isContractor // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContractorsFormImpl implements _ContractorsForm {
  const _$ContractorsFormImpl(
      {this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'supplier_group') this.supplierGroup,
      @JsonKey(name: 'supplier_type') this.supplierType,
      @JsonKey(name: 'custom_is_contractor') this.isContractor});

  factory _$ContractorsFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContractorsFormImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'supplier_group')
  final String? supplierGroup;
  @override
  @JsonKey(name: 'supplier_type')
  final String? supplierType;
  @override
  @JsonKey(name: 'custom_is_contractor')
  final int? isContractor;

  @override
  String toString() {
    return 'ContractorsForm(status: $status, name: $name, supplierGroup: $supplierGroup, supplierType: $supplierType, isContractor: $isContractor)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContractorsFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.supplierGroup, supplierGroup) ||
                other.supplierGroup == supplierGroup) &&
            (identical(other.supplierType, supplierType) ||
                other.supplierType == supplierType) &&
            (identical(other.isContractor, isContractor) ||
                other.isContractor == isContractor));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, name, supplierGroup, supplierType, isContractor);

  /// Create a copy of ContractorsForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContractorsFormImplCopyWith<_$ContractorsFormImpl> get copyWith =>
      __$$ContractorsFormImplCopyWithImpl<_$ContractorsFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContractorsFormImplToJson(
      this,
    );
  }
}

abstract class _ContractorsForm implements ContractorsForm {
  const factory _ContractorsForm(
          {final String? status,
          @JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'supplier_group') final String? supplierGroup,
          @JsonKey(name: 'supplier_type') final String? supplierType,
          @JsonKey(name: 'custom_is_contractor') final int? isContractor}) =
      _$ContractorsFormImpl;

  factory _ContractorsForm.fromJson(Map<String, dynamic> json) =
      _$ContractorsFormImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'supplier_group')
  String? get supplierGroup;
  @override
  @JsonKey(name: 'supplier_type')
  String? get supplierType;
  @override
  @JsonKey(name: 'custom_is_contractor')
  int? get isContractor;

  /// Create a copy of ContractorsForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContractorsFormImplCopyWith<_$ContractorsFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
