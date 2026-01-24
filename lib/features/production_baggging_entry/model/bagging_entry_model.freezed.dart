// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bagging_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BaggingEntryModel _$BaggingEntryModelFromJson(Map<String, dynamic> json) {
  return _BaggingEntryModel.fromJson(json);
}

/// @nodoc
mixin _$BaggingEntryModel {
  String? get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'owner')
  String? get owner => throw _privateConstructorUsedError;
  @JsonKey(name: 'creation')
  String? get creation => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified')
  String? get modified => throw _privateConstructorUsedError;
  @JsonKey(name: 'modified_by')
  String? get modifiedBy => throw _privateConstructorUsedError;
  @JsonKey(name: 'docstatus')
  int? get docstatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'idx')
  int? get idx => throw _privateConstructorUsedError;
  @JsonKey(name: 'company')
  String? get company => throw _privateConstructorUsedError;
  @JsonKey(name: 'shift')
  String? get shift => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_date')
  String? get productionDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'batch')
  String? get batch => throw _privateConstructorUsedError;
  @JsonKey(name: 'amended_from')
  String? get amendedFrom => throw _privateConstructorUsedError;
  @JsonKey(name: 'uom')
  String? get uom => throw _privateConstructorUsedError;
  @JsonKey(name: 'fg_item')
  String? get fgItem => throw _privateConstructorUsedError;
  @JsonKey(name: 'quality_inspection')
  String? get qualityInspection => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_batch_qty')
  double? get totalBatchQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_consumption_created')
  int? get isConsumptionCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_fg_created')
  int? get isFgCreated => throw _privateConstructorUsedError;
  @JsonKey(name: 'production_entry')
  String? get productionEntry => throw _privateConstructorUsedError;

  /// Serializes this BaggingEntryModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BaggingEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaggingEntryModelCopyWith<BaggingEntryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaggingEntryModelCopyWith<$Res> {
  factory $BaggingEntryModelCopyWith(
          BaggingEntryModel value, $Res Function(BaggingEntryModel) then) =
      _$BaggingEntryModelCopyWithImpl<$Res, BaggingEntryModel>;
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'company') String? company,
      @JsonKey(name: 'shift') String? shift,
      @JsonKey(name: 'production_date') String? productionDate,
      @JsonKey(name: 'batch') String? batch,
      @JsonKey(name: 'amended_from') String? amendedFrom,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'fg_item') String? fgItem,
      @JsonKey(name: 'quality_inspection') String? qualityInspection,
      @JsonKey(name: 'total_batch_qty') double? totalBatchQty,
      @JsonKey(name: 'is_consumption_created') int? isConsumptionCreated,
      @JsonKey(name: 'is_fg_created') int? isFgCreated,
      @JsonKey(name: 'production_entry') String? productionEntry});
}

/// @nodoc
class _$BaggingEntryModelCopyWithImpl<$Res, $Val extends BaggingEntryModel>
    implements $BaggingEntryModelCopyWith<$Res> {
  _$BaggingEntryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BaggingEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? idx = freezed,
    Object? company = freezed,
    Object? shift = freezed,
    Object? productionDate = freezed,
    Object? batch = freezed,
    Object? amendedFrom = freezed,
    Object? uom = freezed,
    Object? fgItem = freezed,
    Object? qualityInspection = freezed,
    Object? totalBatchQty = freezed,
    Object? isConsumptionCreated = freezed,
    Object? isFgCreated = freezed,
    Object? productionEntry = freezed,
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
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      productionDate: freezed == productionDate
          ? _value.productionDate
          : productionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      fgItem: freezed == fgItem
          ? _value.fgItem
          : fgItem // ignore: cast_nullable_to_non_nullable
              as String?,
      qualityInspection: freezed == qualityInspection
          ? _value.qualityInspection
          : qualityInspection // ignore: cast_nullable_to_non_nullable
              as String?,
      totalBatchQty: freezed == totalBatchQty
          ? _value.totalBatchQty
          : totalBatchQty // ignore: cast_nullable_to_non_nullable
              as double?,
      isConsumptionCreated: freezed == isConsumptionCreated
          ? _value.isConsumptionCreated
          : isConsumptionCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      isFgCreated: freezed == isFgCreated
          ? _value.isFgCreated
          : isFgCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      productionEntry: freezed == productionEntry
          ? _value.productionEntry
          : productionEntry // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BaggingEntryModelImplCopyWith<$Res>
    implements $BaggingEntryModelCopyWith<$Res> {
  factory _$$BaggingEntryModelImplCopyWith(_$BaggingEntryModelImpl value,
          $Res Function(_$BaggingEntryModelImpl) then) =
      __$$BaggingEntryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'company') String? company,
      @JsonKey(name: 'shift') String? shift,
      @JsonKey(name: 'production_date') String? productionDate,
      @JsonKey(name: 'batch') String? batch,
      @JsonKey(name: 'amended_from') String? amendedFrom,
      @JsonKey(name: 'uom') String? uom,
      @JsonKey(name: 'fg_item') String? fgItem,
      @JsonKey(name: 'quality_inspection') String? qualityInspection,
      @JsonKey(name: 'total_batch_qty') double? totalBatchQty,
      @JsonKey(name: 'is_consumption_created') int? isConsumptionCreated,
      @JsonKey(name: 'is_fg_created') int? isFgCreated,
      @JsonKey(name: 'production_entry') String? productionEntry});
}

/// @nodoc
class __$$BaggingEntryModelImplCopyWithImpl<$Res>
    extends _$BaggingEntryModelCopyWithImpl<$Res, _$BaggingEntryModelImpl>
    implements _$$BaggingEntryModelImplCopyWith<$Res> {
  __$$BaggingEntryModelImplCopyWithImpl(_$BaggingEntryModelImpl _value,
      $Res Function(_$BaggingEntryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BaggingEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? idx = freezed,
    Object? company = freezed,
    Object? shift = freezed,
    Object? productionDate = freezed,
    Object? batch = freezed,
    Object? amendedFrom = freezed,
    Object? uom = freezed,
    Object? fgItem = freezed,
    Object? qualityInspection = freezed,
    Object? totalBatchQty = freezed,
    Object? isConsumptionCreated = freezed,
    Object? isFgCreated = freezed,
    Object? productionEntry = freezed,
  }) {
    return _then(_$BaggingEntryModelImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      owner: freezed == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String?,
      creation: freezed == creation
          ? _value.creation
          : creation // ignore: cast_nullable_to_non_nullable
              as String?,
      modified: freezed == modified
          ? _value.modified
          : modified // ignore: cast_nullable_to_non_nullable
              as String?,
      modifiedBy: freezed == modifiedBy
          ? _value.modifiedBy
          : modifiedBy // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      idx: freezed == idx
          ? _value.idx
          : idx // ignore: cast_nullable_to_non_nullable
              as int?,
      company: freezed == company
          ? _value.company
          : company // ignore: cast_nullable_to_non_nullable
              as String?,
      shift: freezed == shift
          ? _value.shift
          : shift // ignore: cast_nullable_to_non_nullable
              as String?,
      productionDate: freezed == productionDate
          ? _value.productionDate
          : productionDate // ignore: cast_nullable_to_non_nullable
              as String?,
      batch: freezed == batch
          ? _value.batch
          : batch // ignore: cast_nullable_to_non_nullable
              as String?,
      amendedFrom: freezed == amendedFrom
          ? _value.amendedFrom
          : amendedFrom // ignore: cast_nullable_to_non_nullable
              as String?,
      uom: freezed == uom
          ? _value.uom
          : uom // ignore: cast_nullable_to_non_nullable
              as String?,
      fgItem: freezed == fgItem
          ? _value.fgItem
          : fgItem // ignore: cast_nullable_to_non_nullable
              as String?,
      qualityInspection: freezed == qualityInspection
          ? _value.qualityInspection
          : qualityInspection // ignore: cast_nullable_to_non_nullable
              as String?,
      totalBatchQty: freezed == totalBatchQty
          ? _value.totalBatchQty
          : totalBatchQty // ignore: cast_nullable_to_non_nullable
              as double?,
      isConsumptionCreated: freezed == isConsumptionCreated
          ? _value.isConsumptionCreated
          : isConsumptionCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      isFgCreated: freezed == isFgCreated
          ? _value.isFgCreated
          : isFgCreated // ignore: cast_nullable_to_non_nullable
              as int?,
      productionEntry: freezed == productionEntry
          ? _value.productionEntry
          : productionEntry // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BaggingEntryModelImpl implements _BaggingEntryModel {
  const _$BaggingEntryModelImpl(
      {this.status,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'creation') this.creation,
      @JsonKey(name: 'modified') this.modified,
      @JsonKey(name: 'modified_by') this.modifiedBy,
      @JsonKey(name: 'docstatus') this.docstatus,
      @JsonKey(name: 'idx') this.idx,
      @JsonKey(name: 'company') this.company,
      @JsonKey(name: 'shift') this.shift,
      @JsonKey(name: 'production_date') this.productionDate,
      @JsonKey(name: 'batch') this.batch,
      @JsonKey(name: 'amended_from') this.amendedFrom,
      @JsonKey(name: 'uom') this.uom,
      @JsonKey(name: 'fg_item') this.fgItem,
      @JsonKey(name: 'quality_inspection') this.qualityInspection,
      @JsonKey(name: 'total_batch_qty') this.totalBatchQty,
      @JsonKey(name: 'is_consumption_created') this.isConsumptionCreated,
      @JsonKey(name: 'is_fg_created') this.isFgCreated,
      @JsonKey(name: 'production_entry') this.productionEntry});

  factory _$BaggingEntryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaggingEntryModelImplFromJson(json);

  @override
  final String? status;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'owner')
  final String? owner;
  @override
  @JsonKey(name: 'creation')
  final String? creation;
  @override
  @JsonKey(name: 'modified')
  final String? modified;
  @override
  @JsonKey(name: 'modified_by')
  final String? modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  final int? docstatus;
  @override
  @JsonKey(name: 'idx')
  final int? idx;
  @override
  @JsonKey(name: 'company')
  final String? company;
  @override
  @JsonKey(name: 'shift')
  final String? shift;
  @override
  @JsonKey(name: 'production_date')
  final String? productionDate;
  @override
  @JsonKey(name: 'batch')
  final String? batch;
  @override
  @JsonKey(name: 'amended_from')
  final String? amendedFrom;
  @override
  @JsonKey(name: 'uom')
  final String? uom;
  @override
  @JsonKey(name: 'fg_item')
  final String? fgItem;
  @override
  @JsonKey(name: 'quality_inspection')
  final String? qualityInspection;
  @override
  @JsonKey(name: 'total_batch_qty')
  final double? totalBatchQty;
  @override
  @JsonKey(name: 'is_consumption_created')
  final int? isConsumptionCreated;
  @override
  @JsonKey(name: 'is_fg_created')
  final int? isFgCreated;
  @override
  @JsonKey(name: 'production_entry')
  final String? productionEntry;

  @override
  String toString() {
    return 'BaggingEntryModel(status: $status, name: $name, owner: $owner, creation: $creation, modified: $modified, modifiedBy: $modifiedBy, docstatus: $docstatus, idx: $idx, company: $company, shift: $shift, productionDate: $productionDate, batch: $batch, amendedFrom: $amendedFrom, uom: $uom, fgItem: $fgItem, qualityInspection: $qualityInspection, totalBatchQty: $totalBatchQty, isConsumptionCreated: $isConsumptionCreated, isFgCreated: $isFgCreated, productionEntry: $productionEntry)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaggingEntryModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.creation, creation) ||
                other.creation == creation) &&
            (identical(other.modified, modified) ||
                other.modified == modified) &&
            (identical(other.modifiedBy, modifiedBy) ||
                other.modifiedBy == modifiedBy) &&
            (identical(other.docstatus, docstatus) ||
                other.docstatus == docstatus) &&
            (identical(other.idx, idx) || other.idx == idx) &&
            (identical(other.company, company) || other.company == company) &&
            (identical(other.shift, shift) || other.shift == shift) &&
            (identical(other.productionDate, productionDate) ||
                other.productionDate == productionDate) &&
            (identical(other.batch, batch) || other.batch == batch) &&
            (identical(other.amendedFrom, amendedFrom) ||
                other.amendedFrom == amendedFrom) &&
            (identical(other.uom, uom) || other.uom == uom) &&
            (identical(other.fgItem, fgItem) || other.fgItem == fgItem) &&
            (identical(other.qualityInspection, qualityInspection) ||
                other.qualityInspection == qualityInspection) &&
            (identical(other.totalBatchQty, totalBatchQty) ||
                other.totalBatchQty == totalBatchQty) &&
            (identical(other.isConsumptionCreated, isConsumptionCreated) ||
                other.isConsumptionCreated == isConsumptionCreated) &&
            (identical(other.isFgCreated, isFgCreated) ||
                other.isFgCreated == isFgCreated) &&
            (identical(other.productionEntry, productionEntry) ||
                other.productionEntry == productionEntry));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        name,
        owner,
        creation,
        modified,
        modifiedBy,
        docstatus,
        idx,
        company,
        shift,
        productionDate,
        batch,
        amendedFrom,
        uom,
        fgItem,
        qualityInspection,
        totalBatchQty,
        isConsumptionCreated,
        isFgCreated,
        productionEntry
      ]);

  /// Create a copy of BaggingEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaggingEntryModelImplCopyWith<_$BaggingEntryModelImpl> get copyWith =>
      __$$BaggingEntryModelImplCopyWithImpl<_$BaggingEntryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaggingEntryModelImplToJson(
      this,
    );
  }
}

abstract class _BaggingEntryModel implements BaggingEntryModel {
  const factory _BaggingEntryModel(
      {final String? status,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'creation') final String? creation,
      @JsonKey(name: 'modified') final String? modified,
      @JsonKey(name: 'modified_by') final String? modifiedBy,
      @JsonKey(name: 'docstatus') final int? docstatus,
      @JsonKey(name: 'idx') final int? idx,
      @JsonKey(name: 'company') final String? company,
      @JsonKey(name: 'shift') final String? shift,
      @JsonKey(name: 'production_date') final String? productionDate,
      @JsonKey(name: 'batch') final String? batch,
      @JsonKey(name: 'amended_from') final String? amendedFrom,
      @JsonKey(name: 'uom') final String? uom,
      @JsonKey(name: 'fg_item') final String? fgItem,
      @JsonKey(name: 'quality_inspection') final String? qualityInspection,
      @JsonKey(name: 'total_batch_qty') final double? totalBatchQty,
      @JsonKey(name: 'is_consumption_created') final int? isConsumptionCreated,
      @JsonKey(name: 'is_fg_created') final int? isFgCreated,
      @JsonKey(name: 'production_entry')
      final String? productionEntry}) = _$BaggingEntryModelImpl;

  factory _BaggingEntryModel.fromJson(Map<String, dynamic> json) =
      _$BaggingEntryModelImpl.fromJson;

  @override
  String? get status;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'owner')
  String? get owner;
  @override
  @JsonKey(name: 'creation')
  String? get creation;
  @override
  @JsonKey(name: 'modified')
  String? get modified;
  @override
  @JsonKey(name: 'modified_by')
  String? get modifiedBy;
  @override
  @JsonKey(name: 'docstatus')
  int? get docstatus;
  @override
  @JsonKey(name: 'idx')
  int? get idx;
  @override
  @JsonKey(name: 'company')
  String? get company;
  @override
  @JsonKey(name: 'shift')
  String? get shift;
  @override
  @JsonKey(name: 'production_date')
  String? get productionDate;
  @override
  @JsonKey(name: 'batch')
  String? get batch;
  @override
  @JsonKey(name: 'amended_from')
  String? get amendedFrom;
  @override
  @JsonKey(name: 'uom')
  String? get uom;
  @override
  @JsonKey(name: 'fg_item')
  String? get fgItem;
  @override
  @JsonKey(name: 'quality_inspection')
  String? get qualityInspection;
  @override
  @JsonKey(name: 'total_batch_qty')
  double? get totalBatchQty;
  @override
  @JsonKey(name: 'is_consumption_created')
  int? get isConsumptionCreated;
  @override
  @JsonKey(name: 'is_fg_created')
  int? get isFgCreated;
  @override
  @JsonKey(name: 'production_entry')
  String? get productionEntry;

  /// Create a copy of BaggingEntryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaggingEntryModelImplCopyWith<_$BaggingEntryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
