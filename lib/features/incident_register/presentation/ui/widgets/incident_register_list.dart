import 'package:alufluoride/app/widgets/app_page_view2.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/incident_register/model/incident_register_form.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/incident_register_filter_cubit.dart';
import 'package:alufluoride/features/incident_register/presentation/ui/widgets/incident_register_widget.dart';
import 'package:alufluoride/styles/icons.dart';
import 'package:alufluoride/widgets/infinite_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncidentRegisterListScrn extends StatelessWidget {
  const IncidentRegisterListScrn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppPageView2<IncidentRegisterFilterCubit>(
      mode: PageMode2.incidentregister,
      scaffoldBg: AppIcons.bgFrame3.path,
      backgroundColor: const Color(0xFF808080),
      onNew: () => AppRoute.newIncidentReg.push(context),
      child: BlocListener<IncidentRegisterFilterCubit, PageViewFilters>(
        listener: (_, state) => _fetchInitial(context),
        child: InfiniteListViewWidget<IncidentRegistersListCubit,
            IncidentRegisterForm>(
          childBuilder: (context, entry) => IncidentRegisterWidget(
            registerForm: entry,
            onTap: () =>
                AppRoute.newIncidentReg.push<bool?>(context, extra: entry),
          ),
          fetchInitial: () => _fetchInitial(context),
          fetchMore: () => _fetchMore(context),
          emptyListText: 'No Incident Registrations Found.',
        ),
      ),
    );
  }

  void _fetchInitial(BuildContext context) {
    final filters = context.read<IncidentRegisterFilterCubit>().state;
    context.cubit<IncidentRegistersListCubit>().fetchInitial(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }

  void _fetchMore(BuildContext context) {
    final filters = context.read<IncidentRegisterFilterCubit>().state;
    context.cubit<IncidentRegistersListCubit>().fetchMore(
        Pair(StringUtils.docStatusInt(filters.status), filters.query));
  }
}
