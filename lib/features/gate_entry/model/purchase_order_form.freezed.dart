// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'purchase_order_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PurchaseOrderForm _$PurchaseOrderFormFromJson(Map<String, dynamic> json) {
  return _PurchaseOrderForm.fromJson(json);
}

/// @nodoc
mixin _$PurchaseOrderForm {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'supplier')
  String? get supplier => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String? get modified => throw _privateConstructorUsedError;

  /// Serializes this PurchaseOrderForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PurchaseOrderFormCopyWith<PurchaseOrderForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PurchaseOrderFormCopyWith<$Res> {
  factory $PurchaseOrderFormCopyWith(
          PurchaseOrderForm value, $Res Function(PurchaseOrderForm) then) =
      _$PurchaseOrderFormCopyWithImpl<$Res, PurchaseOrderForm>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
      @JsonKey(name: 'supplier') String? supplier,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'modified') String? modified});
}

/// @nodoc
class _$PurchaseOrderFormCopyWithImpl<$Res, $Val extends PurchaseOrderForm>
    implements $PurchaseOrderFormCopyWith<$Res> {
  _$PurchaseOrderFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? creationDate = freezed,
    Object? supplier = freezed,
    Object? status = freezed,
    Object? modified = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PurchaseOrderFormImplCopyWith<$Res>
    implements $PurchaseOrderFormCopyWith<$Res> {
  factory _$$PurchaseOrderFormImplCopyWith(_$PurchaseOrderFormImpl value,
          $Res Function(_$PurchaseOrderFormImpl) then) =
      __$$PurchaseOrderFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'creation', defaultValue: '') String? creationDate,
      @JsonKey(name: 'supplier') String? supplier,
      @JsonKey(name: 'status') String? status,
      @JsonKey(name: 'modified') String? modified});
}

/// @nodoc
class __$$PurchaseOrderFormImplCopyWithImpl<$Res>
    extends _$PurchaseOrderFormCopyWithImpl<$Res, _$PurchaseOrderFormImpl>
    implements _$$PurchaseOrderFormImplCopyWith<$Res> {
  __$$PurchaseOrderFormImplCopyWithImpl(_$PurchaseOrderFormImpl _value,
      $Res Function(_$PurchaseOrderFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? creationDate = freezed,
    Object? supplier = freezed,
    Object? status = freezed,
    Object? modified = freezed,
  }) {
    return _then(_$PurchaseOrderFormImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      creationDate: freezed == creationDate
          ? _value.creationDate
          : creationDate // ignore: cast_nullable_to_non_nullable
              as String?,
      supplier: freezed == supplier
          ? _value.supplier
          : supplier // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PurchaseOrderFormImpl implements _PurchaseOrderForm {
  const _$PurchaseOrderFormImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'creation', defaultValue: '') this.creationDate,
      @JsonKey(name: 'supplier') this.supplier,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'modified') this.modified});

  factory _$PurchaseOrderFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$PurchaseOrderFormImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  final String? creationDate;
  @override
  @JsonKey(name: 'supplier')
  final String? supplier;
  @override
  @JsonKey(name: 'status')
  final String? status;
  @override
  @JsonKey(name: 'modified')
  final String? modified;

  @override
  String toString() {
    return 'PurchaseOrderForm(name: $name, creationDate: $creationDate, supplier: $supplier, status: $status, modified: $modified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PurchaseOrderFormImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.creationDate, creationDate) ||
                other.creationDate == creationDate) &&
            (identical(other.supplier, supplier) ||
                other.supplier == supplier) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.modified, modified) ||
                other.modified == modified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, creationDate, supplier, status, modified);

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PurchaseOrderFormImplCopyWith<_$PurchaseOrderFormImpl> get copyWith =>
      __$$PurchaseOrderFormImplCopyWithImpl<_$PurchaseOrderFormImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PurchaseOrderFormImplToJson(
      this,
    );
  }
}

abstract class _PurchaseOrderForm implements PurchaseOrderForm {
  const factory _PurchaseOrderForm(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'creation', defaultValue: '') final String? creationDate,
      @JsonKey(name: 'supplier') final String? supplier,
      @JsonKey(name: 'status') final String? status,
      @JsonKey(name: 'modified')
      final String? modified}) = _$PurchaseOrderFormImpl;

  factory _PurchaseOrderForm.fromJson(Map<String, dynamic> json) =
      _$PurchaseOrderFormImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'creation', defaultValue: '')
  String? get creationDate;
  @override
  @JsonKey(name: 'supplier')
  String? get supplier;
  @override
  @JsonKey(name: 'status')
  String? get status;
  @override
  @JsonKey(name: 'modified')
  String? get modified;

  /// Create a copy of PurchaseOrderForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PurchaseOrderFormImplCopyWith<_$PurchaseOrderFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
