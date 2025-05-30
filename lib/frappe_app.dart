import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/Create%20Visit/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/Create%20Visit/presentation/bloc/create_visit_filter_cubit.dart';
import 'package:alufluoride/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:alufluoride/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/presentation/bloc/empty_vehicle_filter_cubit.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/gate_entry_filter_cubit.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/gate_exit_filter_cubit.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/incident_register_filter_cubit.dart';
import 'package:alufluoride/features/invite_visitor/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/invite_visitor/presentation/bloc/invite_visitor_filter_cubit.dart';
import 'package:alufluoride/features/inward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/inward_gate_pass/presentation/bloc/inWard_filter_cubit.dart';
import 'package:alufluoride/features/outward_gate_pass/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/outward_gate_pass/presentation/bloc/ouward_filter_cubit.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/bloc/visitor_in_out_filter_cubit.dart';
import 'package:alufluoride/styles/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AparnaApp extends StatelessWidget {
  const AparnaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => $sl.get<AuthCubit>()..authCheckRequested(),
        ),
        BlocProvider(create: (_) => $sl.get<SignInCubit>()),
        BlocProvider(create: (_) => GateExitFilterCubit()),
        BlocProvider(create: (_) => GateEntryFilterCubit()),
        BlocProvider(create: (_) => IncidentRegisterFilterCubit()),
        BlocProvider(create: (_) => InviteVisitorFilterCubit()),
        BlocProvider(create: (_) => VisitorInOutFilterCubit()),
        BlocProvider(create: (_) => CreateVisitFilterCubit()),
        BlocProvider(create: (_) => OutwardFilterCubit()),
        BlocProvider(create: (_) => InwardFilterCubit()),
        BlocProvider(create: (_) => EmptyVehicleFilterCubit()),
        BlocProvider(create: (_) => GateEntryBlocProvider.get().materialNameList()),
        BlocProvider(
            create: (_) => GateEntryBlocProvider.get().fetchGateEntries()),
        BlocProvider(
            create: (_) =>
                IncidentRegisterBlocProvider.get().fetchRegistrations()),
        BlocProvider(create: (_) => GateExitBlocProvider.get().gateExitList()),
        BlocProvider(
            create: (_) => InviteVisitorBlocProvider.get().inviteVisitorList()),
        BlocProvider(
            create: (_) => VisitorInOutBlocProvider.get().visitorInOutList()),
        BlocProvider(
            create: (_) => CreateVisitBlocProvider.get().createVisitList()),
        BlocProvider(create: (_) => OutwardBlocProvider.get().outwardGatePassList()),
        BlocProvider(create: (_) => InwardBlocProvider.get().inWardGatePassList()),
        BlocProvider(create: (_) => EmptyVehicleBlocProvider.get().fetchVehicleList()),
      ],
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (_, state) {
          final routerCtxt = AppRouterConfig.parentNavigatorKey.currentContext;
          state.maybeWhen(
            orElse: () => AppRoute.initial.go(routerCtxt!),
            authenticated: () {
              final filters = Pair(StringUtils.docStatusInt('Draft'), null);
              routerCtxt!
                ..cubit<GateEntriesCubit>().fetchInitial(filters)
                ..cubit<GateExitListCubit>().fetchInitial(filters)
                ..cubit<IncidentRegistersListCubit>().fetchInitial(filters)
                ..cubit<InviteVisitorListCubit>().fetchInitial(filters)
                ..cubit<VisitorInOutListCubit>().fetchInitial(filters)
                ..cubit<CreateVisitListCubit>().fetchInitial(const Pair('Draft', null))
                ..cubit<MaterialNameList>().request()
                ..cubit<OutwardListCubit>().fetchInitial(filters)
                ..cubit<InwardListCubit>().fetchInitial(filters)
                ..cubit<EmptyVehicleListCubit>().fetchInitial(filters);
              AppRoute.home.go(routerCtxt);
            },
            unAuthenticated: () => AppRoute.login.go(routerCtxt!),
          );
        },
        builder: (_, state) {
          return MaterialApp.router(
            title: "Alufluoride Limited",
            theme: AppMaterialTheme.lightTheme,
            darkTheme: AppMaterialTheme.lightTheme,
            routerConfig: AppRouterConfig.router,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
