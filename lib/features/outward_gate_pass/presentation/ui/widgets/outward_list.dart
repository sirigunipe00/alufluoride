import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/outward_gate_pass/model/outward_form.dart';
import 'package:alufluoride/features/outward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/outward_gate_pass/presentation/bloc/ouward_filter_cubit.dart';
import 'package:alufluoride/features/outward_gate_pass/presentation/ui/widgets/outward_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OutwardListScrn extends StatelessWidget {
  const OutwardListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<OutwardFilterCubit>(
      mode: PageMode2.outWardGatePass,
      onNew: () => AppRoute.newOutWardGatePass.push(context),
      backgroundColor: AppColors.shyMoment,
      scaffoldBg: AppIcons.bgFrame2.path,
      child: BlocListener<OutwardFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInitial(context),
        child: InfiniteListViewWidget<OutwardListCubit, OutwardForm>(
          childBuilder: (context, out) => OutwardWidget(
            outward: out,
            onTap: () => AppRoute.newOutWardGatePass.push<bool?>(context, extra: out),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Outward Gate Passes Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filter = context.read<OutwardFilterCubit>().state;
    context.cubit<OutwardListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }

  void _fetchMore(BuildContext context) {
    final filter = context.read<OutwardFilterCubit>().state;
    context
        .cubit<OutwardListCubit>()
        .fetchMore(Pair(StringUtils.docStatusInt(filter.status), filter.query));
  }
}
