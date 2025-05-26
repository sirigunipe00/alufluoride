import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/gate_entry/model/gate_entry_form.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/gate_entry_filter_cubit.dart';
import 'package:alufluoride/features/gate_entry/presentation/ui/widgets/gate_entry_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GateEntryListScrn extends StatelessWidget {
  const GateEntryListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<GateEntryFilterCubit>(
      mode: PageMode2.gateentry,
      scaffoldBg: AppIcons.bgFrame1.path,
      backgroundColor: AppColors.marigoldDDust,
      onNew: () => AppRoute.newGateEntry.push(context),
      child: BlocListener<GateEntryFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInital(context),
        child: InfiniteListViewWidget<GateEntriesCubit, GateEntryForm>(
          childBuilder: (context, entry) => GateEntryWidget(
            gateEntry: entry,
            onTap: () =>
                AppRoute.newGateEntry.push<bool?>(context, extra: entry),
          ),
          fetchInitial: () => _fetchInital(context),
          fetchMore: () => fetchMore(context),
          emptyListText: 'No GateEntries Found.',
        ),
      ),
    );
  }

  void _fetchInital(BuildContext context) {
    final filters = context.read<GateEntryFilterCubit>().state;
    context.cubit<GateEntriesCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }

  void fetchMore(BuildContext context) {
    final filters = context.read<GateEntryFilterCubit>().state;

    context.cubit<GateEntriesCubit>().fetchMore(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }
}
