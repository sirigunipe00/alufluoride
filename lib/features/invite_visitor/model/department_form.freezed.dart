// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DepartmentForm _$DepartmentFormFromJson(Map<String, dynamic> json) {
  return _DepartmentForm.fromJson(json);
}

/// @nodoc
mixin _$DepartmentForm {
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;

  /// Serializes this DepartmentForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DepartmentForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DepartmentFormCopyWith<DepartmentForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DepartmentFormCopyWith<$Res> {
  factory $DepartmentFormCopyWith(
          DepartmentForm value, $Res Function(DepartmentForm) then) =
      _$DepartmentFormCopyWithImpl<$Res, DepartmentForm>;
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class _$DepartmentFormCopyWithImpl<$Res, $Val extends DepartmentForm>
    implements $DepartmentFormCopyWith<$Res> {
  _$DepartmentFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DepartmentForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DepartmentFormImplCopyWith<$Res>
    implements $DepartmentFormCopyWith<$Res> {
  factory _$$DepartmentFormImplCopyWith(_$DepartmentFormImpl value,
          $Res Function(_$DepartmentFormImpl) then) =
      __$$DepartmentFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'name') String name});
}

/// @nodoc
class __$$DepartmentFormImplCopyWithImpl<$Res>
    extends _$DepartmentFormCopyWithImpl<$Res, _$DepartmentFormImpl>
    implements _$$DepartmentFormImplCopyWith<$Res> {
  __$$DepartmentFormImplCopyWithImpl(
      _$DepartmentFormImpl _value, $Res Function(_$DepartmentFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of DepartmentForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$DepartmentFormImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DepartmentFormImpl implements _DepartmentForm {
  _$DepartmentFormImpl({@JsonKey(name: 'name') required this.name});

  factory _$DepartmentFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$DepartmentFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String name;

  @override
  String toString() {
    return 'DepartmentForm(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DepartmentFormImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of DepartmentForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DepartmentFormImplCopyWith<_$DepartmentFormImpl> get copyWith =>
      __$$DepartmentFormImplCopyWithImpl<_$DepartmentFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DepartmentFormImplToJson(
      this,
    );
  }
}

abstract class _DepartmentForm implements DepartmentForm {
  factory _DepartmentForm({@JsonKey(name: 'name') required final String name}) =
      _$DepartmentFormImpl;

  factory _DepartmentForm.fromJson(Map<String, dynamic> json) =
      _$DepartmentFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String get name;

  /// Create a copy of DepartmentForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DepartmentFormImplCopyWith<_$DepartmentFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
