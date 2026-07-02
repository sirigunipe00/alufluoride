import 'package:alufluoride/core/model/pair.dart';
import 'package:alufluoride/core/utils/typedefs.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_bagging.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_items.dart';


abstract interface class DispatchBaggingRepo {
  AsyncValueOf<List<DispatchBaggingModel>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  );
  AsyncValueOf<List<DispatchItemsModel>> fetchItems(String parent);
  AsyncValueOf<Pair<String, String>> createDispatch(List<DispatchItemsModel> form, String name);
}
