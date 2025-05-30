import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'gate_entry_form.freezed.dart';
part 'gate_entry_form.g.dart';

@freezed
class GateEntryForm with _$GateEntryForm {
  const factory GateEntryForm({
    String? status,
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
    @JsonKey(name: 'rate_per_tonnes', defaultValue: 0.0) double? ratePerTonnes,
    // @JsonKey(name: 'weight__in_kgs_') double? weight,
    // @JsonKey(name: 'weighment_date') String? weighmentDate,
    // @JsonKey(name: 'weighment_time') String? weighmentTime,
    // @JsonKey(name: 'commentremark') String? remarks,
    // @JsonKey(name: 'docstatus') int? docStatus,
    // @JsonKey(name: 'sender_name') String? senderName,
    // @JsonKey(name: 'drivers_license_photo') String? driversLicensePhoto,
    // @JsonKey(name: 'vehicle_image') String? vehicleImg,
    // @JsonKey(name: 'seal_photo') String? sealPhoto,
    // @JsonKey(name: 'breath_analyser') String? breathAnalyser,
    // @JsonKey(name: 'invoicedc_image_ocr_scanning') String? ocrScanning,
    // @JsonKey(name: 'total_amount') double? totalAmount,
  }) = _GateEntryForm;

  factory GateEntryForm.fromJson(Map<String, dynamic> json) =>
      _$GateEntryFormFromJson(json);
}

dynamic toNull(_) => null;
