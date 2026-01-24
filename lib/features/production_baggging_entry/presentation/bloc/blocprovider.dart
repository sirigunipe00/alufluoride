import 'package:alufluoride/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:alufluoride/core/cubit/network_request/network_request_cubit.dart';
import 'package:alufluoride/core/di/injector.dart';
import 'package:alufluoride/core/model/pair.dart';
import 'package:alufluoride/features/production_baggging_entry/data/bagging_entry_repo.dart';
import 'package:alufluoride/features/production_baggging_entry/model/bagging_entry_model.dart';
import 'package:alufluoride/features/production_baggging_entry/model/item_model.dart';
import 'package:injectable/injectable.dart';

typedef BaggingEntryCubit = InfiniteListCubit<BaggingEntryModel, Pair<int?, String?>, Pair<int?, String?>>;
typedef BaggingEntryState = InfiniteListState<BaggingEntryModel>;


typedef ItemsCubit = NetworkRequestCubit<List<ItemModel>, String>;
typedef ItemsState = NetworkRequestState<List<ItemModel>>;



@lazySingleton
class BaggingEntryBlocProvider {
  const BaggingEntryBlocProvider(this.repo);

  final BaggingEntryRepo repo;

  static BaggingEntryBlocProvider get() => $sl.get<BaggingEntryBlocProvider>();

  BaggingEntryCubit fetchBaggingEntries() => BaggingEntryCubit(
    requestInitial: (params, state) => repo.fetchEntries(0, params!.first, params.second),
    requestMore: (params, state) => repo.fetchEntries(state.curLength, params!.first, params.second),
  );
   ItemsCubit fetchItems() => ItemsCubit(
    onRequest: (params, state) => repo.fetchItems(params!),
  );

}