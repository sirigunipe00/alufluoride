import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/features/auth/presentation/bloc/auth/auth_cubit.dart';
import 'package:alufluoride/features/auth/presentation/bloc/sign_in/sign_in_cubit.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/gate_entry_filter_cubit.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/gate_exit_filter.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/incident_register_filter_cubit.dart';

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
        BlocProvider(create: (_) => GateEntryFilterCubit()),
        BlocProvider(create: (_) => GateExitFilterCubit()),
        BlocProvider(create: (_) => IncidentRegisterFilterCubit()),
        BlocProvider(
            create: (_) => GateEntryBlocProvider.get().materialNameList()),
        BlocProvider(
            create: (_) => GateEntryBlocProvider.get().fetchGateEntries()),
        BlocProvider(
            create: (_) => GateExitBlocProvider.get().createGateExitsCubit()),
        BlocProvider(
            create: (_) =>
                IncidentRegisterBlocProvider.get().fetchRegistrations()),
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
                ..cubit<IncidentRegistersListCubit>().fetchInitial(filters)
                ..cubit<MaterialNameList>().request()
                ..cubit<GateExitsCubit>()
                    .fetchInitial(PageViewFilters.initial());
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
