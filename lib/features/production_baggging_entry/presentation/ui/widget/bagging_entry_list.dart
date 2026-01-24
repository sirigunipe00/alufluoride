import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/production_baggging_entry/model/bagging_entry_model.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/bagging_entry_filter.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/blocprovider.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/ui/widget/bagging_entry_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BaggingEntryListScrn extends StatelessWidget {
  const BaggingEntryListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<BaggingEntryFilterCubit>(
      mode: PageMode2.baggingEntry,
      scaffoldBg: AppIcons.bgFrame4.path,
      backgroundColor: AppColors.invite,
      onNew: () => AppRoute.newBaggingEntry.push(context),
      child: BlocListener<BaggingEntryFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInital(context),
        child: InfiniteListViewWidget<BaggingEntryCubit, BaggingEntryModel>(
          childBuilder: (context, entry) => BaggingEntryWidget(
            baggingEntry: entry,
            onTap: () =>
                AppRoute.newBaggingEntry.push<bool?>(context, extra: entry),
          ),
          fetchInitial: () => _fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No BaggingEntries Found.',
        ),
      ),
    );
  }

  void _fetchInital(BuildContext context) {
    final filters = context.read<BaggingEntryFilterCubit>().state;
    context.cubit<BaggingEntryCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }

  void fetchMore(BuildContext context) {
    final filters = context.read<BaggingEntryFilterCubit>().state;

    context.cubit<BaggingEntryCubit>().fetchMore(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }
}
