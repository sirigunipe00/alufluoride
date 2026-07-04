import 'dart:convert';
import 'dart:io';
import 'package:alufluoride/features/dispatch_bagging/data/dispatch_bagging_repo.dart';
import 'package:alufluoride/features/dispatch_bagging/model/bag_tracking_items.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_bagging.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_items.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:alufluoride/core/core.dart';

@LazySingleton(as: DispatchBaggingRepo)
class DispatchBaggingRepoImpl extends BaseApiRepository
    implements DispatchBaggingRepo {
  const DispatchBaggingRepoImpl(super.client);

  @override
  AsyncValueOf<List<DispatchBaggingModel>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  ) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => DispatchBaggingModel.fromJson(e)).toList();
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
        'doctype': 'Delivery Note',
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
  AsyncValueOf<List<DispatchItemsModel>> fetchItems(String parent) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => DispatchItemsModel.fromJson(e)).toList();
      },
      reqParams: {
        'filters': [
          ["parent", "=", parent],
        ],
        "parent": "Delivery Note",
        "doctype": "Scanned Bag",
        'order_by': 'idx ASC',
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
  AsyncValueOf<BagTrackingItems> fetchBagTracking(String bagNo) async {
    final requestConfig = RequestConfig(
      url: Urls.getList,
      parser: (json) {
        final data = json['message'];

        final listdata = data as List<dynamic>;
        return listdata.map((e) => BagTrackingItems.fromJson(e)).toList();
      },
      reqParams: {
        'filters': [
          ["name", "=", bagNo],
        ],
        "doctype": "Bag Tracking",
        'fields': ["*"]
      },
      headers: {HttpHeaders.contentTypeHeader: 'application/json'},
    );
    $logger.devLog(requestConfig);
    final response = await get(requestConfig);
     return response.process((r) {
    if (r.data == null || r.data!.isEmpty) {
      return left(
        const Failure(
          title: 'Bag Not Found',
          error: 'No bag found for the scanned QR code.',
          status: 404,
        ),
      );
    }

    return right(r.data!.first);
  });
}
@override
AsyncValueOf<Pair<String, String>> createDispatch(
  List<DispatchItemsModel> items,
  String deliveryNote,
) async {
  final requestConfig = RequestConfig(
    url: Urls.dispatchBagging,
    parser: (json) {
      final message = json['message'] as Map<String, dynamic>;

      final statusMessage = message['message']?.toString() ?? '';
      final dn = message['delivery_note']?.toString() ?? '';

      return Pair(dn, statusMessage);
    },
    body: jsonEncode({
      "delivery_note": deliveryNote,
      "scan_bag": items
          .map((e) => e.bagNo)
          .whereType<String>()
          .toList(),
    }),
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json',
    },
  );

  final response = await post(requestConfig);
  $logger.devLog('createDispatch response: $requestConfig');
  return response.process((r) => right(r.data!));
}
}
