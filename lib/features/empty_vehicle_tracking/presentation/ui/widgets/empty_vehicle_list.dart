import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/model/empty_vehicle_form.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/presentation/bloc/empty_vehicle_filter_cubit.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/presentation/ui/widgets/empty_vehicle_tracking_widget.dart';
import 'package:alufluoride/styles/app_colors.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyVehicleList extends StatelessWidget {
  const EmptyVehicleList({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<EmptyVehicleFilterCubit>(
      mode: PageMode2.emptyVehicle,
      scaffoldBg: AppIcons.bgFrame5.path,
      backgroundColor: AppColors.registration,
      onNew: () => AppRoute.newEmptyVehicle.push(context),
      child: BlocListener<EmptyVehicleFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInitial(context),
        child: InfiniteListViewWidget<EmptyVehicleListCubit,
            EmptyVehicleForm>(
          childBuilder: (context, entry) => EmptyVehicleTrackingWidget(
            vehicleForm: entry,
            onTap: () =>
                AppRoute.newEmptyVehicle.push<bool?>(context, extra: entry),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Empty Vehicle Trackings Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filters = context.read<EmptyVehicleFilterCubit>().state;
    context.cubit<EmptyVehicleListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }

  void _fetchMore(BuildContext context) {
    final filters = context.read<EmptyVehicleFilterCubit>().state;
    context.cubit<EmptyVehicleListCubit>().fetchMore(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }
}
