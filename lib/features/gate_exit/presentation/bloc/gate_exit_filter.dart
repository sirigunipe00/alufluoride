
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/cubit/base/filters_cubit.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';


class GateExitFilterCubit extends FiltersCubit {
  GateExitFilterCubit() : super(PageViewFilters.initial());

  @override
  void onChangeStatus(String status) {
    final newState = state.copyWith(status: status);
    emitSafeState(newState);
  }

  @override
  void onSearch([String? query]) {
    if(query.doesNotHaveValue) {
      emitSafeState(PageViewFilters(status: state.status));
    } else {
      final newState = state.copyWith(query: query);
      emitSafeState(newState);
    }
  }
}