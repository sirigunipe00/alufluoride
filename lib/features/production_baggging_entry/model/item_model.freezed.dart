// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ItemModel _$ItemModelFromJson(Map<String, dynamic> json) {
  return _ItemModel.fromJson(json);
}

/// @nodoc
mixin _$ItemModel {
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
  @JsonKey(name: 'parent')
  String? get parent => throw _privateConstructorUsedError;
  @JsonKey(name: 'parentfield')
  String? get parentfield => throw _privateConstructorUsedError;
  @JsonKey(name: 'parenttype')
  String? get parenttype => throw _privateConstructorUsedError;
  @JsonKey(name: 'bag_no')
  String? get bagNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'pallet_weight')
  double? get palletWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty')
  double? get qty => throw _privateConstructorUsedError;
  @JsonKey(name: 'actual_bag_weight')
  double? get actualBagWeight => throw _privateConstructorUsedError;
  @JsonKey(name: 'serial_no')
  String? get serialNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'sticker_printed')
  int? get stickerPrinted => throw _privateConstructorUsedError;
  @JsonKey(name: 'weight_of_pallet_and_bag')
  double? get weightOfPalletandBag => throw _privateConstructorUsedError;
  @JsonKey(name: 'empty_pallet_and_bag_photo')
  String? get emptyPalletImage => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get emptyWeightFile => throw _privateConstructorUsedError;
  @JsonKey(name: 'weighing_scale')
  String? get weighingScale => throw _privateConstructorUsedError;
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get imageFile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItemModelCopyWith<ItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemModelCopyWith<$Res> {
  factory $ItemModelCopyWith(ItemModel value, $Res Function(ItemModel) then) =
      _$ItemModelCopyWithImpl<$Res, ItemModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'parent') String? parent,
      @JsonKey(name: 'parentfield') String? parentfield,
      @JsonKey(name: 'parenttype') String? parenttype,
      @JsonKey(name: 'bag_no') String? bagNo,
      @JsonKey(name: 'pallet_weight') double? palletWeight,
      @JsonKey(name: 'qty') double? qty,
      @JsonKey(name: 'actual_bag_weight') double? actualBagWeight,
      @JsonKey(name: 'serial_no') String? serialNo,
      @JsonKey(name: 'sticker_printed') int? stickerPrinted,
      @JsonKey(name: 'weight_of_pallet_and_bag') double? weightOfPalletandBag,
      @JsonKey(name: 'empty_pallet_and_bag_photo') String? emptyPalletImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? emptyWeightFile,
      @JsonKey(name: 'weighing_scale') String? weighingScale,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? imageFile});
}

/// @nodoc
class _$ItemModelCopyWithImpl<$Res, $Val extends ItemModel>
    implements $ItemModelCopyWith<$Res> {
  _$ItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? idx = freezed,
    Object? parent = freezed,
    Object? parentfield = freezed,
    Object? parenttype = freezed,
    Object? bagNo = freezed,
    Object? palletWeight = freezed,
    Object? qty = freezed,
    Object? actualBagWeight = freezed,
    Object? serialNo = freezed,
    Object? stickerPrinted = freezed,
    Object? weightOfPalletandBag = freezed,
    Object? emptyPalletImage = freezed,
    Object? emptyWeightFile = freezed,
    Object? weighingScale = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_value.copyWith(
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
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      parentfield: freezed == parentfield
          ? _value.parentfield
          : parentfield // ignore: cast_nullable_to_non_nullable
              as String?,
      parenttype: freezed == parenttype
          ? _value.parenttype
          : parenttype // ignore: cast_nullable_to_non_nullable
              as String?,
      bagNo: freezed == bagNo
          ? _value.bagNo
          : bagNo // ignore: cast_nullable_to_non_nullable
              as String?,
      palletWeight: freezed == palletWeight
          ? _value.palletWeight
          : palletWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double?,
      actualBagWeight: freezed == actualBagWeight
          ? _value.actualBagWeight
          : actualBagWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      stickerPrinted: freezed == stickerPrinted
          ? _value.stickerPrinted
          : stickerPrinted // ignore: cast_nullable_to_non_nullable
              as int?,
      weightOfPalletandBag: freezed == weightOfPalletandBag
          ? _value.weightOfPalletandBag
          : weightOfPalletandBag // ignore: cast_nullable_to_non_nullable
              as double?,
      emptyPalletImage: freezed == emptyPalletImage
          ? _value.emptyPalletImage
          : emptyPalletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      emptyWeightFile: freezed == emptyWeightFile
          ? _value.emptyWeightFile
          : emptyWeightFile // ignore: cast_nullable_to_non_nullable
              as File?,
      weighingScale: freezed == weighingScale
          ? _value.weighingScale
          : weighingScale // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemModelImplCopyWith<$Res>
    implements $ItemModelCopyWith<$Res> {
  factory _$$ItemModelImplCopyWith(
          _$ItemModelImpl value, $Res Function(_$ItemModelImpl) then) =
      __$$ItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'owner') String? owner,
      @JsonKey(name: 'creation') String? creation,
      @JsonKey(name: 'modified') String? modified,
      @JsonKey(name: 'modified_by') String? modifiedBy,
      @JsonKey(name: 'docstatus') int? docstatus,
      @JsonKey(name: 'idx') int? idx,
      @JsonKey(name: 'parent') String? parent,
      @JsonKey(name: 'parentfield') String? parentfield,
      @JsonKey(name: 'parenttype') String? parenttype,
      @JsonKey(name: 'bag_no') String? bagNo,
      @JsonKey(name: 'pallet_weight') double? palletWeight,
      @JsonKey(name: 'qty') double? qty,
      @JsonKey(name: 'actual_bag_weight') double? actualBagWeight,
      @JsonKey(name: 'serial_no') String? serialNo,
      @JsonKey(name: 'sticker_printed') int? stickerPrinted,
      @JsonKey(name: 'weight_of_pallet_and_bag') double? weightOfPalletandBag,
      @JsonKey(name: 'empty_pallet_and_bag_photo') String? emptyPalletImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? emptyWeightFile,
      @JsonKey(name: 'weighing_scale') String? weighingScale,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      File? imageFile});
}

/// @nodoc
class __$$ItemModelImplCopyWithImpl<$Res>
    extends _$ItemModelCopyWithImpl<$Res, _$ItemModelImpl>
    implements _$$ItemModelImplCopyWith<$Res> {
  __$$ItemModelImplCopyWithImpl(
      _$ItemModelImpl _value, $Res Function(_$ItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? owner = freezed,
    Object? creation = freezed,
    Object? modified = freezed,
    Object? modifiedBy = freezed,
    Object? docstatus = freezed,
    Object? idx = freezed,
    Object? parent = freezed,
    Object? parentfield = freezed,
    Object? parenttype = freezed,
    Object? bagNo = freezed,
    Object? palletWeight = freezed,
    Object? qty = freezed,
    Object? actualBagWeight = freezed,
    Object? serialNo = freezed,
    Object? stickerPrinted = freezed,
    Object? weightOfPalletandBag = freezed,
    Object? emptyPalletImage = freezed,
    Object? emptyWeightFile = freezed,
    Object? weighingScale = freezed,
    Object? imageFile = freezed,
  }) {
    return _then(_$ItemModelImpl(
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
      parent: freezed == parent
          ? _value.parent
          : parent // ignore: cast_nullable_to_non_nullable
              as String?,
      parentfield: freezed == parentfield
          ? _value.parentfield
          : parentfield // ignore: cast_nullable_to_non_nullable
              as String?,
      parenttype: freezed == parenttype
          ? _value.parenttype
          : parenttype // ignore: cast_nullable_to_non_nullable
              as String?,
      bagNo: freezed == bagNo
          ? _value.bagNo
          : bagNo // ignore: cast_nullable_to_non_nullable
              as String?,
      palletWeight: freezed == palletWeight
          ? _value.palletWeight
          : palletWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      qty: freezed == qty
          ? _value.qty
          : qty // ignore: cast_nullable_to_non_nullable
              as double?,
      actualBagWeight: freezed == actualBagWeight
          ? _value.actualBagWeight
          : actualBagWeight // ignore: cast_nullable_to_non_nullable
              as double?,
      serialNo: freezed == serialNo
          ? _value.serialNo
          : serialNo // ignore: cast_nullable_to_non_nullable
              as String?,
      stickerPrinted: freezed == stickerPrinted
          ? _value.stickerPrinted
          : stickerPrinted // ignore: cast_nullable_to_non_nullable
              as int?,
      weightOfPalletandBag: freezed == weightOfPalletandBag
          ? _value.weightOfPalletandBag
          : weightOfPalletandBag // ignore: cast_nullable_to_non_nullable
              as double?,
      emptyPalletImage: freezed == emptyPalletImage
          ? _value.emptyPalletImage
          : emptyPalletImage // ignore: cast_nullable_to_non_nullable
              as String?,
      emptyWeightFile: freezed == emptyWeightFile
          ? _value.emptyWeightFile
          : emptyWeightFile // ignore: cast_nullable_to_non_nullable
              as File?,
      weighingScale: freezed == weighingScale
          ? _value.weighingScale
          : weighingScale // ignore: cast_nullable_to_non_nullable
              as String?,
      imageFile: freezed == imageFile
          ? _value.imageFile
          : imageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemModelImpl implements _ItemModel {
  const _$ItemModelImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'owner') this.owner,
      @JsonKey(name: 'creation') this.creation,
      @JsonKey(name: 'modified') this.modified,
      @JsonKey(name: 'modified_by') this.modifiedBy,
      @JsonKey(name: 'docstatus') this.docstatus,
      @JsonKey(name: 'idx') this.idx,
      @JsonKey(name: 'parent') this.parent,
      @JsonKey(name: 'parentfield') this.parentfield,
      @JsonKey(name: 'parenttype') this.parenttype,
      @JsonKey(name: 'bag_no') this.bagNo,
      @JsonKey(name: 'pallet_weight') this.palletWeight,
      @JsonKey(name: 'qty') this.qty,
      @JsonKey(name: 'actual_bag_weight') this.actualBagWeight,
      @JsonKey(name: 'serial_no') this.serialNo,
      @JsonKey(name: 'sticker_printed') this.stickerPrinted,
      @JsonKey(name: 'weight_of_pallet_and_bag') this.weightOfPalletandBag,
      @JsonKey(name: 'empty_pallet_and_bag_photo') this.emptyPalletImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.emptyWeightFile,
      @JsonKey(name: 'weighing_scale') this.weighingScale,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      this.imageFile});

  factory _$ItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemModelImplFromJson(json);

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
  @JsonKey(name: 'parent')
  final String? parent;
  @override
  @JsonKey(name: 'parentfield')
  final String? parentfield;
  @override
  @JsonKey(name: 'parenttype')
  final String? parenttype;
  @override
  @JsonKey(name: 'bag_no')
  final String? bagNo;
  @override
  @JsonKey(name: 'pallet_weight')
  final double? palletWeight;
  @override
  @JsonKey(name: 'qty')
  final double? qty;
  @override
  @JsonKey(name: 'actual_bag_weight')
  final double? actualBagWeight;
  @override
  @JsonKey(name: 'serial_no')
  final String? serialNo;
  @override
  @JsonKey(name: 'sticker_printed')
  final int? stickerPrinted;
  @override
  @JsonKey(name: 'weight_of_pallet_and_bag')
  final double? weightOfPalletandBag;
  @override
  @JsonKey(name: 'empty_pallet_and_bag_photo')
  final String? emptyPalletImage;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? emptyWeightFile;
  @override
  @JsonKey(name: 'weighing_scale')
  final String? weighingScale;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  final File? imageFile;

  @override
  String toString() {
    return 'ItemModel(name: $name, owner: $owner, creation: $creation, modified: $modified, modifiedBy: $modifiedBy, docstatus: $docstatus, idx: $idx, parent: $parent, parentfield: $parentfield, parenttype: $parenttype, bagNo: $bagNo, palletWeight: $palletWeight, qty: $qty, actualBagWeight: $actualBagWeight, serialNo: $serialNo, stickerPrinted: $stickerPrinted, weightOfPalletandBag: $weightOfPalletandBag, emptyPalletImage: $emptyPalletImage, emptyWeightFile: $emptyWeightFile, weighingScale: $weighingScale, imageFile: $imageFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemModelImpl &&
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
            (identical(other.parent, parent) || other.parent == parent) &&
            (identical(other.parentfield, parentfield) ||
                other.parentfield == parentfield) &&
            (identical(other.parenttype, parenttype) ||
                other.parenttype == parenttype) &&
            (identical(other.bagNo, bagNo) || other.bagNo == bagNo) &&
            (identical(other.palletWeight, palletWeight) ||
                other.palletWeight == palletWeight) &&
            (identical(other.qty, qty) || other.qty == qty) &&
            (identical(other.actualBagWeight, actualBagWeight) ||
                other.actualBagWeight == actualBagWeight) &&
            (identical(other.serialNo, serialNo) ||
                other.serialNo == serialNo) &&
            (identical(other.stickerPrinted, stickerPrinted) ||
                other.stickerPrinted == stickerPrinted) &&
            (identical(other.weightOfPalletandBag, weightOfPalletandBag) ||
                other.weightOfPalletandBag == weightOfPalletandBag) &&
            (identical(other.emptyPalletImage, emptyPalletImage) ||
                other.emptyPalletImage == emptyPalletImage) &&
            (identical(other.emptyWeightFile, emptyWeightFile) ||
                other.emptyWeightFile == emptyWeightFile) &&
            (identical(other.weighingScale, weighingScale) ||
                other.weighingScale == weighingScale) &&
            (identical(other.imageFile, imageFile) ||
                other.imageFile == imageFile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        owner,
        creation,
        modified,
        modifiedBy,
        docstatus,
        idx,
        parent,
        parentfield,
        parenttype,
        bagNo,
        palletWeight,
        qty,
        actualBagWeight,
        serialNo,
        stickerPrinted,
        weightOfPalletandBag,
        emptyPalletImage,
        emptyWeightFile,
        weighingScale,
        imageFile
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemModelImplCopyWith<_$ItemModelImpl> get copyWith =>
      __$$ItemModelImplCopyWithImpl<_$ItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemModelImplToJson(
      this,
    );
  }
}

abstract class _ItemModel implements ItemModel {
  const factory _ItemModel(
      {@JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'owner') final String? owner,
      @JsonKey(name: 'creation') final String? creation,
      @JsonKey(name: 'modified') final String? modified,
      @JsonKey(name: 'modified_by') final String? modifiedBy,
      @JsonKey(name: 'docstatus') final int? docstatus,
      @JsonKey(name: 'idx') final int? idx,
      @JsonKey(name: 'parent') final String? parent,
      @JsonKey(name: 'parentfield') final String? parentfield,
      @JsonKey(name: 'parenttype') final String? parenttype,
      @JsonKey(name: 'bag_no') final String? bagNo,
      @JsonKey(name: 'pallet_weight') final double? palletWeight,
      @JsonKey(name: 'qty') final double? qty,
      @JsonKey(name: 'actual_bag_weight') final double? actualBagWeight,
      @JsonKey(name: 'serial_no') final String? serialNo,
      @JsonKey(name: 'sticker_printed') final int? stickerPrinted,
      @JsonKey(name: 'weight_of_pallet_and_bag')
      final double? weightOfPalletandBag,
      @JsonKey(name: 'empty_pallet_and_bag_photo')
      final String? emptyPalletImage,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? emptyWeightFile,
      @JsonKey(name: 'weighing_scale') final String? weighingScale,
      @JsonKey(
          includeFromJson: true,
          includeToJson: false,
          toJson: toNull,
          fromJson: toNull)
      final File? imageFile}) = _$ItemModelImpl;

  factory _ItemModel.fromJson(Map<String, dynamic> json) =
      _$ItemModelImpl.fromJson;

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
  @JsonKey(name: 'parent')
  String? get parent;
  @override
  @JsonKey(name: 'parentfield')
  String? get parentfield;
  @override
  @JsonKey(name: 'parenttype')
  String? get parenttype;
  @override
  @JsonKey(name: 'bag_no')
  String? get bagNo;
  @override
  @JsonKey(name: 'pallet_weight')
  double? get palletWeight;
  @override
  @JsonKey(name: 'qty')
  double? get qty;
  @override
  @JsonKey(name: 'actual_bag_weight')
  double? get actualBagWeight;
  @override
  @JsonKey(name: 'serial_no')
  String? get serialNo;
  @override
  @JsonKey(name: 'sticker_printed')
  int? get stickerPrinted;
  @override
  @JsonKey(name: 'weight_of_pallet_and_bag')
  double? get weightOfPalletandBag;
  @override
  @JsonKey(name: 'empty_pallet_and_bag_photo')
  String? get emptyPalletImage;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get emptyWeightFile;
  @override
  @JsonKey(name: 'weighing_scale')
  String? get weighingScale;
  @override
  @JsonKey(
      includeFromJson: true,
      includeToJson: false,
      toJson: toNull,
      fromJson: toNull)
  File? get imageFile;
  @override
  @JsonKey(ignore: true)
  _$$ItemModelImplCopyWith<_$ItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
