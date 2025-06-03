import 'package:alufluoride/app/widgets/app_page_view3.dart';
import 'package:alufluoride/core/app_router/app_route.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/gate_exit/model/gate_exit.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/gate_exit_filter.dart';
import 'package:alufluoride/features/gate_exit/presentation/widgets/gate_exit_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class GateExitListScrn extends StatelessWidget {
  const GateExitListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView3<GateExitFilterCubit>(
      mode: PageMode3.gateexit,
      scaffoldBg: AppIcons.bgFrame2.path,
      backgroundColor: AppColors.shyMoment,
      onNew: () => AppRoute.newGateExit.push(context),
      onUpdateQuery: (value) {
        context.cubit<GateExitFilterCubit>().onSearch(value);
        fetchInital(context);
      },
      onUpdateStatus: (value) {
        context.cubit<GateExitFilterCubit>().onChangeStatus(value);
        fetchInital(context);
      },
      status: const ['All','Draft', 'Submitted','Cancelled'],
      child: InfiniteListViewWidget<GateExitsCubit, GateExit>(
        childBuilder: (context, exit) => GateExitWidget(
          gateExit: exit,
          onTap: () =>
            AppRoute.newGateExit.push<bool?>(context, extra: exit.name),
          
        ),
        fetchInitial: () => fetchInital(context),
        fetchMore: () => fetchMore(context),
        emptyListText: 'No GateExits Found',
      ),
    );
  }

  void fetchInital(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context.cubit<GateExitsCubit>().fetchInitial(filter);
  }

  void fetchMore(BuildContext context) {
    final filter = context.read<GateExitFilterCubit>().state;
    context.cubit<GateExitsCubit>().fetchMore(filter);
  }
}
