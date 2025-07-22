import 'dart:convert';
import 'dart:io';

import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/contract_employee/data/contract_employee_repo.dart';
import 'package:alufluoride/features/contract_employee/model/contract_employee_form.dart';
import 'package:alufluoride/features/contract_employee/model/contractors_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ContractEmployeeRepo)
class ContractEmployeeRepoImpl extends BaseApiRepository
    implements ContractEmployeeRepo {
  const ContractEmployeeRepoImpl(super.client);

  @override
  AsyncValueOf<List<ContractEmployeeForm>> fetchEmployees(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];
        final listdata = data as List<dynamic>;
        return listdata.map((e) => ContractEmployeeForm.fromJson(e)).toList();
      },
      reqParams: {
        if (!(docStatus == null)) ...{
          'filters': [
            ["docstatus", "=", docStatus],
            if (search.containsValidValue) ...{
              ["name", "Like", "%$search%"]
            }
          ],
        },
        'limit_start': start,
        'limit': 20,
        'order_by': 'creation desc',
        'doctype': 'Contract Employee',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog('..........$requestConfig');
    final response = await get(requestConfig);
    $logger.devLog(response);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<ContractorsForm>> fetchContractors() async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];
        final listdata = data as List<dynamic>;
        return listdata.map((e) => ContractorsForm.fromJson(e)).toList();
      },
      reqParams: {
        'order_by': 'creation desc',
        'doctype': 'Supplier',
        'filters': jsonEncode({
          "custom_is_contractor": 1,
        }),
        'fields': jsonEncode(
            ["name", "supplier_group", "supplier_type", "custom_is_contractor"])
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    $logger.devLog('fetchContractors requestConfig: $requestConfig');
    final response = await get(requestConfig);
    $logger.devLog('Response Body$response');

    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> submitContractEmployee(
      ContractEmployeeForm form) async {
    return await executeSafely(() async {
      // final unsavedLines = lines.where((e) => e.name.doesNotHaveValue);
      // await updateGateEntry(
      //     form.copyWith(name: form.name), unsavedLines.toList());
      // final files = {
      //   'drivers_license_photo': form.licensePhotoImg,
      //   'vehicle_image': form.vehiclePhotoImg,
      //   'seal_photo': form.sealPhotoImg,
      //   'breath_analyser': form.breathAnalyserImg,
      //   'invoicedc_image_ocr_scanning': form.invoiceImg.firstOrNull,
      // };
      //   files.removeWhere((key, value) => value == null);
      //   final responseurlMap = <String, dynamic>{};
      //   final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
      //   final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
      //   for (final file in files.keys) {
      //     final indx = files.keys.toList().indexOf(file);
      //     responseurlMap[file] = urls.elementAtOrNull(indx);
      //   }
      //   final addFiles = <File>[];
      //   if (form.invoiceImg.length > 1) {
      //     for (int i = 1; i < form.invoiceImg.length; i++) {
      //       addFiles.add(form.invoiceImg.elementAt(i));
      //     }
      //   }
      //   await _uploadAddfiles(addFiles, form.name!);

      //   final finalMap = {
      //     ...removeNullValues(form.toJson()),
      //     ...responseurlMap,
      //   };
      //   if(form.deletedLines.isNotEmpty){
      //  await deleteLines(form.name!,form.deletedLines);

      //   }
      // final reqBody = finalMap..remove('status');
      final config = RequestConfig(
          url: Urls.submitContractEmployee,
          parser: (json) {
            final data = json['message']['message'] as String;
            final docNo = json['message']['docname'] as String;

            return Pair(data, docNo);
          },
          body: jsonEncode({"contract_employee_id": form.name}));

      final response = await post(config);
      return response.process((r) {
        return right(Pair(r.data!.second, ''));
      });
    });
  }

  @override
  AsyncValueOf<Pair<String, String>> createContractEmployee(
      ContractEmployeeForm form) async {
    final formJson = form.toJson();
    $logger.devLog('create form....----:$form ');

    $logger.devLog('.....create  formJson----:$formJson ');

    // formJson.update('status', (value) => 'Draft');

    // final files = {
    //   'vehicle_photo': form.vehiclePhoto,
    //   'before_work': form.beforeWork,
    // };
    // final addFiles = <File>[];
    // for (int i = 1; i < form.invoiceImg.length; i++) {
    //   addFiles.add(form.invoiceImg.elementAt(i));
    // }
    // files.removeWhere((key, value) => value == null);
    // final responseurlMap = <String, dynamic>{};
    // final fileUrlRes = await _uploadfiles(files.values.nonNulls.toList());
    // final urls = fileUrlRes.fold((l) => throw Exception(l.error), (r) => r);
    // for (final file in files.keys) {
    //   final indx = files.keys.toList().indexOf(file);
    //   responseurlMap[file] = urls.elementAtOrNull(indx);

    // }

    // final filemap = {
    //   'vehicle_photo': '/private/files/bharat.png',
    //   'before_work': '/private/files/bharat.png',
    // };

    final finalMap = {...removeNullValues(form.toJson())};
    $logger.devLog('......map $finalMap');

    final requestConfig = RequestConfig(
      url: Urls.createContractEmployee,
      body: jsonEncode(finalMap),
      parser: (json) {
        final data = json['message']['message'] as String;
        final docNo = json['message']['docname'] as String;

        return Pair(data, docNo);
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog('create requestConfig----:$requestConfig ');
    final response = await post(requestConfig);
    return response.processAsync((r) async {
      final updatedForm = form.copyWith(name: r.data!.second);
      await updateContractEmployee(updatedForm);
      return right(Pair(r.data!.second, r.data!.second));
    });
  }

  @override
  AsyncValueOf<String> updateContractEmployee(ContractEmployeeForm form) async {
    final formData = form.toJson();
    // formData
    //   // // ..remove('name')
    //   // ..remove('skill_type')
    //   // ..remove('daily_wages');

    $logger.devLog("formdata....$formData");

    final reqMap = removeNullValues(form.toJson());
    $logger.devLog("reqmap.....$reqMap");

    final requestConfig = RequestConfig(
      url: Urls.updateContractEmployee,
      body: jsonEncode(removeNullValues({
        'name': form.name,
        'contract_employee': form.toJson(),
        ...formData,
      })),
      // ...other config...
      parser: (json) {
        final data = json['message']['message'];
        return data;
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog("requestconfig.......$requestConfig");
    final response = await post(requestConfig);
    $logger.devLog('response...$response');
    return response.process((r) => right(r.data!));
  }
}
