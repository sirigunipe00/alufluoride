import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/core/model/page_view_filters_cubit.dart';

class IncidentRegisterFilterCubit extends PageViewFiltersCubit {
  IncidentRegisterFilterCubit() : super(PageViewFilters.initial());

  @override
  void onChangeStatus(String? status) {
    if (status != null && status.isNotEmpty) {
      final newState = state.copyWith(status: status);
      emitSafeState(newState);
    } else {
      final newState = state.copyWith(status: 'Draft');
      emitSafeState(newState);
    }
  }

  @override
  void onSearch([String? query]) {
    if (query.doesNotHaveValue) {
      emitSafeState(PageViewFilters(status: state.status));
    } else {
      final newState = state.copyWith(query: query);
      emitSafeState(newState);
    }
  }
}
