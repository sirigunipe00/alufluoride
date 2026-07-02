import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_bagging.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/dispatch_filter_cubit.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/ui/widget/dispatch_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DispatchBaggingList extends StatelessWidget {
  const DispatchBaggingList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<DispatchFilterCubit>(
      mode: PageMode2.baggingDispatch,
      scaffoldBg: AppIcons.incidentRegistration.path,
      backgroundColor: AppColors.registration,
      onNew: () => AppRoute.newBaggingDispatch.push(context),
      child: BlocListener<DispatchFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInital(context),
        child: InfiniteListViewWidget<DispatchBaggingCubit, DispatchBaggingModel>(
          childBuilder: (context, entry) => DispatchWidget(
            dispatch: entry,
            onTap: () =>
                AppRoute.newBaggingDispatch.push<bool?>(context, extra: entry),
          ),
          fetchInitial: () => _fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No Bagging Dispatch Found.',
        ),
      ),
    );
  }

  void _fetchInital(BuildContext context) {
    final filters = context.read<DispatchFilterCubit>().state;
    context.cubit<DispatchBaggingCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }

  void fetchMore(BuildContext context) {
    final filters = context.read<DispatchFilterCubit>().state;
    context.cubit<DispatchBaggingCubit>().fetchMore(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }
}
