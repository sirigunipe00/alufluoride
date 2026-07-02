import 'package:alufluoride/core/cubit/infinite_list/infinite_list_cubit.dart';
import 'package:alufluoride/core/cubit/network_request/network_request_cubit.dart';
import 'package:alufluoride/core/di/injector.dart';
import 'package:alufluoride/core/model/pair.dart';
import 'package:alufluoride/features/dispatch_bagging/data/dispatch_bagging_repo.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_bagging.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_items.dart';
import 'package:injectable/injectable.dart';

typedef DispatchBaggingCubit = InfiniteListCubit<DispatchBaggingModel, Pair<int?, String?>, Pair<int?, String?>>;
typedef DispatchBaggingState = InfiniteListState<DispatchBaggingModel>;


typedef ItemsCubit = NetworkRequestCubit<List<DispatchItemsModel>, String>;
typedef ItemsState = NetworkRequestState<List<DispatchItemsModel>>;

@lazySingleton
class DispatchBaggingBlocProvider {
  const DispatchBaggingBlocProvider(this.repo);

  final DispatchBaggingRepo repo;

  static DispatchBaggingBlocProvider get() => $sl.get<DispatchBaggingBlocProvider>();

  DispatchBaggingCubit fetchDispatchEntries() => DispatchBaggingCubit(
    requestInitial: (params, state) => repo.fetchEntries(0, params!.first, params.second),
    requestMore: (params, state) => repo.fetchEntries(state.curLength, params!.first, params.second),
  );
   ItemsCubit fetchItems() => ItemsCubit(
    onRequest: (params, state) => repo.fetchItems(params!),
  );

}