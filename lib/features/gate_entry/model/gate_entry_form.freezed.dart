// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gate_entry_form.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GateEntryForm _$GateEntryFormFromJson(Map<String, dynamic> json) {
  return _GateEntryForm.fromJson(json);
}

/// @nodoc
mixin _$GateEntryForm {
  String? get status => throw _privateConstructorUsedError;
  int? get docstatus => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_entry_time')
  String? get entryTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_entry_type')
  String? get entryType => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_request')
  String? get vehicleRequest => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle')
  String? get vehicle => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle1')
  String? get vehicle1 => throw _privateConstructorUsedError;
  @JsonKey(name: 'pay_type')
  String? get payType => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_invoice_date')
  String? get vendorInvoiceDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_invoice_quantity')
  double? get invoiceQnty => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_amount')
  double? get invoiceAmt => throw _privateConstructorUsedError;
  @JsonKey(name: 'gate_entry_date')
  String? get gateEntryDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_time', defaultValue: '')
  String? get createdTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'after_work')
  String? get afterWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'in_time')
  String? get intime => throw _privateConstructorUsedError;
  @JsonKey(name: 'out_time')
  String? get outTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_hour_amount')
  String? get perHrAmt => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount')
  double? get amount => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_mobile')
  String? get drivermobileNo => throw _privateConstructorUsedError;
  @JsonKey(name: 'driver_name')
  String? get driverName => throw _privateConstructorUsedError;
  @JsonKey(name: 'remarks')
  String? get remarks => throw _privateConstructorUsedError;
  @JsonKey(name: 'po_number')
  String? get poNumber => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_invoice_no')
  String? get vendorInvNum => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor_invoice_photo')
  String? get vendorInvPhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'vehicle_photo')
  String? get vehiclePhoto => throw _privateConstructorUsedError;
  @JsonKey(name: 'before_work')
  String? get beforeWork => throw _privateConstructorUsedError;
  @JsonKey(name: 'qty_in_tonnes', defaultValue: 0)
  int? get qtyinTonnes => throw _privateConstructorUsedError;
  @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0)
  double? get ratePerTonnes => throw _privateConstructorUsedError;

  /// Serializes this GateEntryForm to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GateEntryFormCopyWith<GateEntryForm> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GateEntryFormCopyWith<$Res> {
  factory $GateEntryFormCopyWith(
          GateEntryForm value, $Res Function(GateEntryForm) then) =
      _$GateEntryFormCopyWithImpl<$Res, GateEntryForm>;
  @useResult
  $Res call(
      {String? status,
      int? docstatus,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'gate_entry_time') String? entryTime,
      @JsonKey(name: 'gate_entry_type') String? entryType,
      @JsonKey(name: 'vehicle_request') String? vehicleRequest,
      @JsonKey(name: 'vehicle') String? vehicle,
      @JsonKey(name: 'vehicle1') String? vehicle1,
      @JsonKey(name: 'pay_type') String? payType,
      @JsonKey(name: 'vendor_invoice_date') String? vendorInvoiceDate,
      @JsonKey(name: 'vendor_invoice_quantity') double? invoiceQnty,
      @JsonKey(name: 'invoice_amount') double? invoiceAmt,
      @JsonKey(name: 'gate_entry_date') String? gateEntryDate,
      @JsonKey(name: 'created_time', defaultValue: '') String? createdTime,
      @JsonKey(name: 'after_work') String? afterWork,
      @JsonKey(name: 'in_time') String? intime,
      @JsonKey(name: 'out_time') String? outTime,
      @JsonKey(name: 'per_hour_amount') String? perHrAmt,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'driver_mobile') String? drivermobileNo,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'remarks') String? remarks,
      @JsonKey(name: 'po_number') String? poNumber,
      @JsonKey(name: 'vendor_invoice_no') String? vendorInvNum,
      @JsonKey(name: 'vendor_invoice_photo') String? vendorInvPhoto,
      @JsonKey(name: 'vehicle_photo') String? vehiclePhoto,
      @JsonKey(name: 'before_work') String? beforeWork,
      @JsonKey(name: 'qty_in_tonnes', defaultValue: 0) int? qtyinTonnes,
      @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0)
      double? ratePerTonnes});
}

/// @nodoc
class _$GateEntryFormCopyWithImpl<$Res, $Val extends GateEntryForm>
    implements $GateEntryFormCopyWith<$Res> {
  _$GateEntryFormCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? docstatus = freezed,
    Object? name = freezed,
    Object? entryTime = freezed,
    Object? entryType = freezed,
    Object? vehicleRequest = freezed,
    Object? vehicle = freezed,
    Object? vehicle1 = freezed,
    Object? payType = freezed,
    Object? vendorInvoiceDate = freezed,
    Object? invoiceQnty = freezed,
    Object? invoiceAmt = freezed,
    Object? gateEntryDate = freezed,
    Object? createdTime = freezed,
    Object? afterWork = freezed,
    Object? intime = freezed,
    Object? outTime = freezed,
    Object? perHrAmt = freezed,
    Object? amount = freezed,
    Object? drivermobileNo = freezed,
    Object? driverName = freezed,
    Object? remarks = freezed,
    Object? poNumber = freezed,
    Object? vendorInvNum = freezed,
    Object? vendorInvPhoto = freezed,
    Object? vehiclePhoto = freezed,
    Object? beforeWork = freezed,
    Object? qtyinTonnes = freezed,
    Object? ratePerTonnes = freezed,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      entryTime: freezed == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleRequest: freezed == vehicleRequest
          ? _value.vehicleRequest
          : vehicleRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle1: freezed == vehicle1
          ? _value.vehicle1
          : vehicle1 // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: freezed == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvoiceDate: freezed == vendorInvoiceDate
          ? _value.vendorInvoiceDate
          : vendorInvoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceQnty: freezed == invoiceQnty
          ? _value.invoiceQnty
          : invoiceQnty // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceAmt: freezed == invoiceAmt
          ? _value.invoiceAmt
          : invoiceAmt // ignore: cast_nullable_to_non_nullable
              as double?,
      gateEntryDate: freezed == gateEntryDate
          ? _value.gateEntryDate
          : gateEntryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      afterWork: freezed == afterWork
          ? _value.afterWork
          : afterWork // ignore: cast_nullable_to_non_nullable
              as String?,
      intime: freezed == intime
          ? _value.intime
          : intime // ignore: cast_nullable_to_non_nullable
              as String?,
      outTime: freezed == outTime
          ? _value.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as String?,
      perHrAmt: freezed == perHrAmt
          ? _value.perHrAmt
          : perHrAmt // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      drivermobileNo: freezed == drivermobileNo
          ? _value.drivermobileNo
          : drivermobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvNum: freezed == vendorInvNum
          ? _value.vendorInvNum
          : vendorInvNum // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvPhoto: freezed == vendorInvPhoto
          ? _value.vendorInvPhoto
          : vendorInvPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhoto: freezed == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      beforeWork: freezed == beforeWork
          ? _value.beforeWork
          : beforeWork // ignore: cast_nullable_to_non_nullable
              as String?,
      qtyinTonnes: freezed == qtyinTonnes
          ? _value.qtyinTonnes
          : qtyinTonnes // ignore: cast_nullable_to_non_nullable
              as int?,
      ratePerTonnes: freezed == ratePerTonnes
          ? _value.ratePerTonnes
          : ratePerTonnes // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GateEntryFormImplCopyWith<$Res>
    implements $GateEntryFormCopyWith<$Res> {
  factory _$$GateEntryFormImplCopyWith(
          _$GateEntryFormImpl value, $Res Function(_$GateEntryFormImpl) then) =
      __$$GateEntryFormImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? status,
      int? docstatus,
      @JsonKey(name: 'name') String? name,
      @JsonKey(name: 'gate_entry_time') String? entryTime,
      @JsonKey(name: 'gate_entry_type') String? entryType,
      @JsonKey(name: 'vehicle_request') String? vehicleRequest,
      @JsonKey(name: 'vehicle') String? vehicle,
      @JsonKey(name: 'vehicle1') String? vehicle1,
      @JsonKey(name: 'pay_type') String? payType,
      @JsonKey(name: 'vendor_invoice_date') String? vendorInvoiceDate,
      @JsonKey(name: 'vendor_invoice_quantity') double? invoiceQnty,
      @JsonKey(name: 'invoice_amount') double? invoiceAmt,
      @JsonKey(name: 'gate_entry_date') String? gateEntryDate,
      @JsonKey(name: 'created_time', defaultValue: '') String? createdTime,
      @JsonKey(name: 'after_work') String? afterWork,
      @JsonKey(name: 'in_time') String? intime,
      @JsonKey(name: 'out_time') String? outTime,
      @JsonKey(name: 'per_hour_amount') String? perHrAmt,
      @JsonKey(name: 'amount') double? amount,
      @JsonKey(name: 'driver_mobile') String? drivermobileNo,
      @JsonKey(name: 'driver_name') String? driverName,
      @JsonKey(name: 'remarks') String? remarks,
      @JsonKey(name: 'po_number') String? poNumber,
      @JsonKey(name: 'vendor_invoice_no') String? vendorInvNum,
      @JsonKey(name: 'vendor_invoice_photo') String? vendorInvPhoto,
      @JsonKey(name: 'vehicle_photo') String? vehiclePhoto,
      @JsonKey(name: 'before_work') String? beforeWork,
      @JsonKey(name: 'qty_in_tonnes', defaultValue: 0) int? qtyinTonnes,
      @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0)
      double? ratePerTonnes});
}

/// @nodoc
class __$$GateEntryFormImplCopyWithImpl<$Res>
    extends _$GateEntryFormCopyWithImpl<$Res, _$GateEntryFormImpl>
    implements _$$GateEntryFormImplCopyWith<$Res> {
  __$$GateEntryFormImplCopyWithImpl(
      _$GateEntryFormImpl _value, $Res Function(_$GateEntryFormImpl) _then)
      : super(_value, _then);

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? docstatus = freezed,
    Object? name = freezed,
    Object? entryTime = freezed,
    Object? entryType = freezed,
    Object? vehicleRequest = freezed,
    Object? vehicle = freezed,
    Object? vehicle1 = freezed,
    Object? payType = freezed,
    Object? vendorInvoiceDate = freezed,
    Object? invoiceQnty = freezed,
    Object? invoiceAmt = freezed,
    Object? gateEntryDate = freezed,
    Object? createdTime = freezed,
    Object? afterWork = freezed,
    Object? intime = freezed,
    Object? outTime = freezed,
    Object? perHrAmt = freezed,
    Object? amount = freezed,
    Object? drivermobileNo = freezed,
    Object? driverName = freezed,
    Object? remarks = freezed,
    Object? poNumber = freezed,
    Object? vendorInvNum = freezed,
    Object? vendorInvPhoto = freezed,
    Object? vehiclePhoto = freezed,
    Object? beforeWork = freezed,
    Object? qtyinTonnes = freezed,
    Object? ratePerTonnes = freezed,
  }) {
    return _then(_$GateEntryFormImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String?,
      docstatus: freezed == docstatus
          ? _value.docstatus
          : docstatus // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      entryTime: freezed == entryTime
          ? _value.entryTime
          : entryTime // ignore: cast_nullable_to_non_nullable
              as String?,
      entryType: freezed == entryType
          ? _value.entryType
          : entryType // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicleRequest: freezed == vehicleRequest
          ? _value.vehicleRequest
          : vehicleRequest // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle: freezed == vehicle
          ? _value.vehicle
          : vehicle // ignore: cast_nullable_to_non_nullable
              as String?,
      vehicle1: freezed == vehicle1
          ? _value.vehicle1
          : vehicle1 // ignore: cast_nullable_to_non_nullable
              as String?,
      payType: freezed == payType
          ? _value.payType
          : payType // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvoiceDate: freezed == vendorInvoiceDate
          ? _value.vendorInvoiceDate
          : vendorInvoiceDate // ignore: cast_nullable_to_non_nullable
              as String?,
      invoiceQnty: freezed == invoiceQnty
          ? _value.invoiceQnty
          : invoiceQnty // ignore: cast_nullable_to_non_nullable
              as double?,
      invoiceAmt: freezed == invoiceAmt
          ? _value.invoiceAmt
          : invoiceAmt // ignore: cast_nullable_to_non_nullable
              as double?,
      gateEntryDate: freezed == gateEntryDate
          ? _value.gateEntryDate
          : gateEntryDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdTime: freezed == createdTime
          ? _value.createdTime
          : createdTime // ignore: cast_nullable_to_non_nullable
              as String?,
      afterWork: freezed == afterWork
          ? _value.afterWork
          : afterWork // ignore: cast_nullable_to_non_nullable
              as String?,
      intime: freezed == intime
          ? _value.intime
          : intime // ignore: cast_nullable_to_non_nullable
              as String?,
      outTime: freezed == outTime
          ? _value.outTime
          : outTime // ignore: cast_nullable_to_non_nullable
              as String?,
      perHrAmt: freezed == perHrAmt
          ? _value.perHrAmt
          : perHrAmt // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      drivermobileNo: freezed == drivermobileNo
          ? _value.drivermobileNo
          : drivermobileNo // ignore: cast_nullable_to_non_nullable
              as String?,
      driverName: freezed == driverName
          ? _value.driverName
          : driverName // ignore: cast_nullable_to_non_nullable
              as String?,
      remarks: freezed == remarks
          ? _value.remarks
          : remarks // ignore: cast_nullable_to_non_nullable
              as String?,
      poNumber: freezed == poNumber
          ? _value.poNumber
          : poNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvNum: freezed == vendorInvNum
          ? _value.vendorInvNum
          : vendorInvNum // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorInvPhoto: freezed == vendorInvPhoto
          ? _value.vendorInvPhoto
          : vendorInvPhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      vehiclePhoto: freezed == vehiclePhoto
          ? _value.vehiclePhoto
          : vehiclePhoto // ignore: cast_nullable_to_non_nullable
              as String?,
      beforeWork: freezed == beforeWork
          ? _value.beforeWork
          : beforeWork // ignore: cast_nullable_to_non_nullable
              as String?,
      qtyinTonnes: freezed == qtyinTonnes
          ? _value.qtyinTonnes
          : qtyinTonnes // ignore: cast_nullable_to_non_nullable
              as int?,
      ratePerTonnes: freezed == ratePerTonnes
          ? _value.ratePerTonnes
          : ratePerTonnes // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GateEntryFormImpl implements _GateEntryForm {
  const _$GateEntryFormImpl(
      {this.status,
      this.docstatus,
      @JsonKey(name: 'name') this.name,
      @JsonKey(name: 'gate_entry_time') this.entryTime,
      @JsonKey(name: 'gate_entry_type') this.entryType,
      @JsonKey(name: 'vehicle_request') this.vehicleRequest,
      @JsonKey(name: 'vehicle') this.vehicle,
      @JsonKey(name: 'vehicle1') this.vehicle1,
      @JsonKey(name: 'pay_type') this.payType,
      @JsonKey(name: 'vendor_invoice_date') this.vendorInvoiceDate,
      @JsonKey(name: 'vendor_invoice_quantity') this.invoiceQnty,
      @JsonKey(name: 'invoice_amount') this.invoiceAmt,
      @JsonKey(name: 'gate_entry_date') this.gateEntryDate,
      @JsonKey(name: 'created_time', defaultValue: '') this.createdTime,
      @JsonKey(name: 'after_work') this.afterWork,
      @JsonKey(name: 'in_time') this.intime,
      @JsonKey(name: 'out_time') this.outTime,
      @JsonKey(name: 'per_hour_amount') this.perHrAmt,
      @JsonKey(name: 'amount') this.amount,
      @JsonKey(name: 'driver_mobile') this.drivermobileNo,
      @JsonKey(name: 'driver_name') this.driverName,
      @JsonKey(name: 'remarks') this.remarks,
      @JsonKey(name: 'po_number') this.poNumber,
      @JsonKey(name: 'vendor_invoice_no') this.vendorInvNum,
      @JsonKey(name: 'vendor_invoice_photo') this.vendorInvPhoto,
      @JsonKey(name: 'vehicle_photo') this.vehiclePhoto,
      @JsonKey(name: 'before_work') this.beforeWork,
      @JsonKey(name: 'qty_in_tonnes', defaultValue: 0) this.qtyinTonnes,
      @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0) this.ratePerTonnes});

  factory _$GateEntryFormImpl.fromJson(Map<String, dynamic> json) =>
      _$$GateEntryFormImplFromJson(json);

  @override
  final String? status;
  @override
  final int? docstatus;
  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'gate_entry_time')
  final String? entryTime;
  @override
  @JsonKey(name: 'gate_entry_type')
  final String? entryType;
  @override
  @JsonKey(name: 'vehicle_request')
  final String? vehicleRequest;
  @override
  @JsonKey(name: 'vehicle')
  final String? vehicle;
  @override
  @JsonKey(name: 'vehicle1')
  final String? vehicle1;
  @override
  @JsonKey(name: 'pay_type')
  final String? payType;
  @override
  @JsonKey(name: 'vendor_invoice_date')
  final String? vendorInvoiceDate;
  @override
  @JsonKey(name: 'vendor_invoice_quantity')
  final double? invoiceQnty;
  @override
  @JsonKey(name: 'invoice_amount')
  final double? invoiceAmt;
  @override
  @JsonKey(name: 'gate_entry_date')
  final String? gateEntryDate;
  @override
  @JsonKey(name: 'created_time', defaultValue: '')
  final String? createdTime;
  @override
  @JsonKey(name: 'after_work')
  final String? afterWork;
  @override
  @JsonKey(name: 'in_time')
  final String? intime;
  @override
  @JsonKey(name: 'out_time')
  final String? outTime;
  @override
  @JsonKey(name: 'per_hour_amount')
  final String? perHrAmt;
  @override
  @JsonKey(name: 'amount')
  final double? amount;
  @override
  @JsonKey(name: 'driver_mobile')
  final String? drivermobileNo;
  @override
  @JsonKey(name: 'driver_name')
  final String? driverName;
  @override
  @JsonKey(name: 'remarks')
  final String? remarks;
  @override
  @JsonKey(name: 'po_number')
  final String? poNumber;
  @override
  @JsonKey(name: 'vendor_invoice_no')
  final String? vendorInvNum;
  @override
  @JsonKey(name: 'vendor_invoice_photo')
  final String? vendorInvPhoto;
  @override
  @JsonKey(name: 'vehicle_photo')
  final String? vehiclePhoto;
  @override
  @JsonKey(name: 'before_work')
  final String? beforeWork;
  @override
  @JsonKey(name: 'qty_in_tonnes', defaultValue: 0)
  final int? qtyinTonnes;
  @override
  @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0)
  final double? ratePerTonnes;

  @override
  String toString() {
    return 'GateEntryForm(status: $status, docstatus: $docstatus, name: $name, entryTime: $entryTime, entryType: $entryType, vehicleRequest: $vehicleRequest, vehicle: $vehicle, vehicle1: $vehicle1, payType: $payType, vendorInvoiceDate: $vendorInvoiceDate, invoiceQnty: $invoiceQnty, invoiceAmt: $invoiceAmt, gateEntryDate: $gateEntryDate, createdTime: $createdTime, afterWork: $afterWork, intime: $intime, outTime: $outTime, perHrAmt: $perHrAmt, amount: $amount, drivermobileNo: $drivermobileNo, driverName: $driverName, remarks: $remarks, poNumber: $poNumber, vendorInvNum: $vendorInvNum, vendorInvPhoto: $vendorInvPhoto, vehiclePhoto: $vehiclePhoto, beforeWork: $beforeWork, qtyinTonnes: $qtyinTonnes, ratePerTonnes: $ratePerTonnes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GateEntryFormImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.docstatus, docstatus) ||
                other.docstatus == docstatus) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.entryTime, entryTime) ||
                other.entryTime == entryTime) &&
            (identical(other.entryType, entryType) ||
                other.entryType == entryType) &&
            (identical(other.vehicleRequest, vehicleRequest) ||
                other.vehicleRequest == vehicleRequest) &&
            (identical(other.vehicle, vehicle) || other.vehicle == vehicle) &&
            (identical(other.vehicle1, vehicle1) ||
                other.vehicle1 == vehicle1) &&
            (identical(other.payType, payType) || other.payType == payType) &&
            (identical(other.vendorInvoiceDate, vendorInvoiceDate) ||
                other.vendorInvoiceDate == vendorInvoiceDate) &&
            (identical(other.invoiceQnty, invoiceQnty) ||
                other.invoiceQnty == invoiceQnty) &&
            (identical(other.invoiceAmt, invoiceAmt) ||
                other.invoiceAmt == invoiceAmt) &&
            (identical(other.gateEntryDate, gateEntryDate) ||
                other.gateEntryDate == gateEntryDate) &&
            (identical(other.createdTime, createdTime) ||
                other.createdTime == createdTime) &&
            (identical(other.afterWork, afterWork) ||
                other.afterWork == afterWork) &&
            (identical(other.intime, intime) || other.intime == intime) &&
            (identical(other.outTime, outTime) || other.outTime == outTime) &&
            (identical(other.perHrAmt, perHrAmt) ||
                other.perHrAmt == perHrAmt) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.drivermobileNo, drivermobileNo) ||
                other.drivermobileNo == drivermobileNo) &&
            (identical(other.driverName, driverName) ||
                other.driverName == driverName) &&
            (identical(other.remarks, remarks) || other.remarks == remarks) &&
            (identical(other.poNumber, poNumber) ||
                other.poNumber == poNumber) &&
            (identical(other.vendorInvNum, vendorInvNum) ||
                other.vendorInvNum == vendorInvNum) &&
            (identical(other.vendorInvPhoto, vendorInvPhoto) ||
                other.vendorInvPhoto == vendorInvPhoto) &&
            (identical(other.vehiclePhoto, vehiclePhoto) ||
                other.vehiclePhoto == vehiclePhoto) &&
            (identical(other.beforeWork, beforeWork) ||
                other.beforeWork == beforeWork) &&
            (identical(other.qtyinTonnes, qtyinTonnes) ||
                other.qtyinTonnes == qtyinTonnes) &&
            (identical(other.ratePerTonnes, ratePerTonnes) ||
                other.ratePerTonnes == ratePerTonnes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        status,
        docstatus,
        name,
        entryTime,
        entryType,
        vehicleRequest,
        vehicle,
        vehicle1,
        payType,
        vendorInvoiceDate,
        invoiceQnty,
        invoiceAmt,
        gateEntryDate,
        createdTime,
        afterWork,
        intime,
        outTime,
        perHrAmt,
        amount,
        drivermobileNo,
        driverName,
        remarks,
        poNumber,
        vendorInvNum,
        vendorInvPhoto,
        vehiclePhoto,
        beforeWork,
        qtyinTonnes,
        ratePerTonnes
      ]);

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      __$$GateEntryFormImplCopyWithImpl<_$GateEntryFormImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GateEntryFormImplToJson(
      this,
    );
  }
}

abstract class _GateEntryForm implements GateEntryForm {
  const factory _GateEntryForm(
      {final String? status,
      final int? docstatus,
      @JsonKey(name: 'name') final String? name,
      @JsonKey(name: 'gate_entry_time') final String? entryTime,
      @JsonKey(name: 'gate_entry_type') final String? entryType,
      @JsonKey(name: 'vehicle_request') final String? vehicleRequest,
      @JsonKey(name: 'vehicle') final String? vehicle,
      @JsonKey(name: 'vehicle1') final String? vehicle1,
      @JsonKey(name: 'pay_type') final String? payType,
      @JsonKey(name: 'vendor_invoice_date') final String? vendorInvoiceDate,
      @JsonKey(name: 'vendor_invoice_quantity') final double? invoiceQnty,
      @JsonKey(name: 'invoice_amount') final double? invoiceAmt,
      @JsonKey(name: 'gate_entry_date') final String? gateEntryDate,
      @JsonKey(name: 'created_time', defaultValue: '')
      final String? createdTime,
      @JsonKey(name: 'after_work') final String? afterWork,
      @JsonKey(name: 'in_time') final String? intime,
      @JsonKey(name: 'out_time') final String? outTime,
      @JsonKey(name: 'per_hour_amount') final String? perHrAmt,
      @JsonKey(name: 'amount') final double? amount,
      @JsonKey(name: 'driver_mobile') final String? drivermobileNo,
      @JsonKey(name: 'driver_name') final String? driverName,
      @JsonKey(name: 'remarks') final String? remarks,
      @JsonKey(name: 'po_number') final String? poNumber,
      @JsonKey(name: 'vendor_invoice_no') final String? vendorInvNum,
      @JsonKey(name: 'vendor_invoice_photo') final String? vendorInvPhoto,
      @JsonKey(name: 'vehicle_photo') final String? vehiclePhoto,
      @JsonKey(name: 'before_work') final String? beforeWork,
      @JsonKey(name: 'qty_in_tonnes', defaultValue: 0) final int? qtyinTonnes,
      @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0)
      final double? ratePerTonnes}) = _$GateEntryFormImpl;

  factory _GateEntryForm.fromJson(Map<String, dynamic> json) =
      _$GateEntryFormImpl.fromJson;

  @override
  String? get status;
  @override
  int? get docstatus;
  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'gate_entry_time')
  String? get entryTime;
  @override
  @JsonKey(name: 'gate_entry_type')
  String? get entryType;
  @override
  @JsonKey(name: 'vehicle_request')
  String? get vehicleRequest;
  @override
  @JsonKey(name: 'vehicle')
  String? get vehicle;
  @override
  @JsonKey(name: 'vehicle1')
  String? get vehicle1;
  @override
  @JsonKey(name: 'pay_type')
  String? get payType;
  @override
  @JsonKey(name: 'vendor_invoice_date')
  String? get vendorInvoiceDate;
  @override
  @JsonKey(name: 'vendor_invoice_quantity')
  double? get invoiceQnty;
  @override
  @JsonKey(name: 'invoice_amount')
  double? get invoiceAmt;
  @override
  @JsonKey(name: 'gate_entry_date')
  String? get gateEntryDate;
  @override
  @JsonKey(name: 'created_time', defaultValue: '')
  String? get createdTime;
  @override
  @JsonKey(name: 'after_work')
  String? get afterWork;
  @override
  @JsonKey(name: 'in_time')
  String? get intime;
  @override
  @JsonKey(name: 'out_time')
  String? get outTime;
  @override
  @JsonKey(name: 'per_hour_amount')
  String? get perHrAmt;
  @override
  @JsonKey(name: 'amount')
  double? get amount;
  @override
  @JsonKey(name: 'driver_mobile')
  String? get drivermobileNo;
  @override
  @JsonKey(name: 'driver_name')
  String? get driverName;
  @override
  @JsonKey(name: 'remarks')
  String? get remarks;
  @override
  @JsonKey(name: 'po_number')
  String? get poNumber;
  @override
  @JsonKey(name: 'vendor_invoice_no')
  String? get vendorInvNum;
  @override
  @JsonKey(name: 'vendor_invoice_photo')
  String? get vendorInvPhoto;
  @override
  @JsonKey(name: 'vehicle_photo')
  String? get vehiclePhoto;
  @override
  @JsonKey(name: 'before_work')
  String? get beforeWork;
  @override
  @JsonKey(name: 'qty_in_tonnes', defaultValue: 0)
  int? get qtyinTonnes;
  @override
  @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0)
  double? get ratePerTonnes;

  /// Create a copy of GateEntryForm
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GateEntryFormImplCopyWith<_$GateEntryFormImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
