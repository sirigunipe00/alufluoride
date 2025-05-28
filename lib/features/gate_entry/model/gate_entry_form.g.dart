// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gate_entry_form.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GateEntryFormImpl _$$GateEntryFormImplFromJson(Map<String, dynamic> json) =>
    _$GateEntryFormImpl(
      status: json['status'] as String?,
      docstatus: (json['docstatus'] as num?)?.toInt(),
      name: json['name'] as String?,
      entryTime: json['gate_entry_time'] as String?,
      entryType: json['gate_entry_type'] as String?,
      vehicleRequest: json['vehicle_request'] as String?,
      vehicle: json['vehicle'] as String?,
      payType: json['pay_type'] as String?,
      vendorInvoiceDate: json['vendor_invoice_date'] as String?,
      invoiceQnty: (json['vendor_invoice_quantity'] as num?)?.toDouble(),
      invoiceAmt: (json['invoice_amount'] as num?)?.toDouble(),
      gateEntryDate: json['gate_entry_date'] as String?,
      createdTime: json['created_time'] as String? ?? '',
      afterWork: json['after_work'] as String?,
      intime: json['in_time'] as String?,
      outTime: json['out_time'] as String?,
      perHrAmt: json['per_hour_amount'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      drivermobileNo: json['driver_mobile'] as String?,
      driverName: json['driver_name'] as String?,
      remarks: json['remarks'] as String?,
      poNumber: json['po_number'] as String?,
      vendorInvNum: json['vendor_invoice_no'] as String?,
      vendorInvPhoto: json['vendor_invoice_photo'] as String?,
    );

Map<String, dynamic> _$$GateEntryFormImplToJson(_$GateEntryFormImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'docstatus': instance.docstatus,
      'name': instance.name,
      'gate_entry_time': instance.entryTime,
      'gate_entry_type': instance.entryType,
      'vehicle_request': instance.vehicleRequest,
      'vehicle': instance.vehicle,
      'pay_type': instance.payType,
      'vendor_invoice_date': instance.vendorInvoiceDate,
      'vendor_invoice_quantity': instance.invoiceQnty,
      'invoice_amount': instance.invoiceAmt,
      'gate_entry_date': instance.gateEntryDate,
      'created_time': instance.createdTime,
      'after_work': instance.afterWork,
      'in_time': instance.intime,
      'out_time': instance.outTime,
      'per_hour_amount': instance.perHrAmt,
      'amount': instance.amount,
      'driver_mobile': instance.drivermobileNo,
      'driver_name': instance.driverName,
      'remarks': instance.remarks,
      'po_number': instance.poNumber,
      'vendor_invoice_no': instance.vendorInvNum,
      'vendor_invoice_photo': instance.vendorInvPhoto,
    };
