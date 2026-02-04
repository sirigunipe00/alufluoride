import 'dart:convert';
import 'dart:io';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/production_baggging_entry/data/bagging_entry_repo.dart';
import 'package:alufluoride/features/production_baggging_entry/model/bagging_entry_model.dart';
import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
import 'package:alufluoride/features/production_baggging_entry/model/weightment_result.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: BaggingEntryRepo)
class BaggingEntryRepoImpl extends BaseApiRepository
    implements BaggingEntryRepo {
  const BaggingEntryRepoImpl(super.client);

  @override
  AsyncValueOf<List<BaggingEntryModel>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => BaggingEntryModel.fromJson(e)).toList();
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
        'order_by': 'creation DESC',
        'doctype': 'Production Bagging Entry',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    $logger.devLog('fetchEntries bagging entry response: $response');
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<Pair<String, String>> createBaggingEntry(
      List<ItemModel> items, String name) async {
    final requestConfig = RequestConfig(
      url: Urls.createBaggigEntry,
      parser: (json) {
        final outerMessage = json['message'] as Map<String, dynamic>;

        final dataList = outerMessage['data'] as List<dynamic>;

        String entryName = '';
        if (dataList.isNotEmpty) {
          entryName = (dataList[0]['parent'] ?? '').toString();
        }

        String statusMessage = (outerMessage['message'] ?? '').toString();

        return Pair(entryName, statusMessage);
      },
      body: jsonEncode({
        "id": name,
        "items": items
            .map((item) => {
                  "bag_no": item.bagNo,
                  "qty": item.qty,
                  "weighing_scale": item.weighingScale,
                })
            .toList(),
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await post(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<String> submitBaggingEntry(String id) async {
    final requestConfig = RequestConfig(
      url: Urls.submitBaggigEntry,
      parser: (json) {
        final outerMessage = json['message']['message'] as String;

        return outerMessage;
      },
      body: jsonEncode({
        "id": id,
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );

    final response = await post(requestConfig);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<List<ItemModel>> fetchItems(String parent) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => ItemModel.fromJson(e)).toList();
      },
      reqParams: {
        'filters': [
          ["parent", "=", parent],
        ],
        'parent': 'Production Bagging Entry',
        'doctype': 'Production Bagging Entry Lines',
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
    $logger.devLog(response);
    return response.process((r) => right(r.data!));
  }

  @override
  AsyncValueOf<WeightmentResult> getweightmentResult(String imagePath) {
    return executeSafely(() async {
      final config = RequestConfig(
        url: Urls.getweightmentResult,
        body: jsonEncode({
          'base64_image': imagePath,
        }),
        parser: (p0) {
          final data = p0['message'];
          return WeightmentResult.fromJson(data);
        },
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );

      final response = await post(config);
      return response.process((r) => right(r.data!));
    });
  }
}
