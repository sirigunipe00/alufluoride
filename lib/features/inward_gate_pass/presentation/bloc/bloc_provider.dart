import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/inward_gate_pass/data/inward_repo.dart';

import 'package:alufluoride/features/inward_gate_pass/model/inward_form.dart';
import 'package:alufluoride/features/outward_gate_pass/model/items_form.dart';
import 'package:alufluoride/features/outward_gate_pass/model/outward_form.dart';

import 'package:injectable/injectable.dart';

typedef InwardListCubit
    = InfiniteListCubit<InwardForm, Pair<int?, String?>, Pair<int?, String?>>;
typedef InwardListCubitState = InfiniteListState<InwardForm>;

typedef OutwardNoListCubit = NetworkRequestCubit<List<OutwardForm>, String>;
typedef OutwardNoListCubitState = NetworkRequestState<List<OutwardForm>>;

typedef InwardLinesCubit
    = NetworkRequestCubit<List<ItemsForm>, String>;
typedef InwardLinesCubitState = NetworkRequestState<List<ItemsForm>>;

@lazySingleton
class InwardBlocProvider {
  const InwardBlocProvider(this.repo);

  final InwardRepo repo;

  static InwardBlocProvider get() => $sl.get<InwardBlocProvider>();

  InwardListCubit inWardGatePassList() => InwardListCubit(
        requestInitial: (params, state) =>
            repo.fetchInwards(0, params!.first, params.second),
        requestMore: (params, state) =>
            repo.fetchInwards(state.curLength, params!.first, params.second),
      );

  OutwardNoListCubit outwardGatePassList() => OutwardNoListCubit(
        onRequest: (params, state) => repo.fetchOutwards(),
      );
   InwardLinesCubit fetchInwardItemLines() => InwardLinesCubit(
        onRequest: (params, state) => repo.fetchInwardLines(params!),
      );
}
