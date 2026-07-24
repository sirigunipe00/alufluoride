import 'package:alufluoride/core/model/pair.dart';
import 'package:alufluoride/core/utils/typedefs.dart';
import 'package:alufluoride/features/production_baggging_entry/model/bagging_entry_model.dart';
import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
import 'package:alufluoride/features/production_baggging_entry/model/weightment_result.dart';

abstract interface class BaggingEntryRepo {
  AsyncValueOf<List<BaggingEntryModel>> fetchEntries(
    int start,
    int? docStatus,
    String? search,
  );
  AsyncValueOf<Pair<String, String>> createBaggingEntry(List<ItemModel> form, String name);
  AsyncValueOf<String> submitBaggingEntry(String id);
  AsyncValueOf<List<ItemModel>> fetchItems(String parent);
  AsyncValueOf<WeightmentResult> getweightmentResult(
    String base64Image,);
}
