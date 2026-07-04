import 'package:alufluoride/app/presentation/app_home_page.dart';
import 'package:alufluoride/app/presentation/app_profile_page.dart';
import 'package:alufluoride/app/presentation/app_splash_scrn.dart';
import 'package:alufluoride/app/presentation/app_update_blocprovider.dart';
import 'package:alufluoride/app/widgets/app_scaffold_widget.dart';
import 'package:alufluoride/app/widgets/image_preview_scrn.dart';
import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/Create%20Visit/model/create_visit_form.dart';
import 'package:alufluoride/features/Create%20Visit/presentation/bloc/cubit/create_visit_cubit.dart';
import 'package:alufluoride/features/Create%20Visit/presentation/ui/create/new_create_visit_widget.dart';
import 'package:alufluoride/features/Create%20Visit/presentation/ui/widgets/create_visit_list.dart';
import 'package:alufluoride/features/auth/presentation/authentication_scrn.dart';
import 'package:alufluoride/features/contract_employee/model/contract_employee_form.dart';
import 'package:alufluoride/features/contract_employee/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/contract_employee/presentation/bloc/create_contract_employee/contract_employee_cubit.dart';
import 'package:alufluoride/features/contract_employee/presentation/ui/create/new_contract_employee.dart';
import 'package:alufluoride/features/contract_employee/presentation/ui/widgets/contract_employess_list.dart';
import 'package:alufluoride/features/dispatch_bagging/model/dispatch_bagging.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/bloc/create_dispatch_cubit/create_dispatch_cubit.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/ui/create/new_dispatch_bagging.dart';
import 'package:alufluoride/features/dispatch_bagging/presentation/ui/widget/dispatch_list.dart';
import 'package:alufluoride/features/gate_entry/model/gate_entry_form.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart';
import 'package:alufluoride/features/gate_entry/presentation/ui/create/new_gate_entry.dart';
import 'package:alufluoride/features/gate_entry/presentation/ui/widgets/gate_entry_list.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart';
import 'package:alufluoride/features/gate_exit/presentation/ui/create/new_gate_exit.dart';
import 'package:alufluoride/features/gate_exit/presentation/ui/gate_exit_list/gate_exit_list.dart';
import 'package:alufluoride/features/incident_register/model/incident_register_form.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/incident_register/presentation/bloc/create_incident_register/incident_register_cubit.dart';
import 'package:alufluoride/features/incident_register/presentation/ui/create/new_incident_register.dart';
import 'package:alufluoride/features/incident_register/presentation/ui/widgets/incident_register_list.dart';
import 'package:alufluoride/features/invite_visitor/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/invite_visitor/presentation/bloc/cubit/create_invite_visitor_cubit.dart';
import 'package:alufluoride/features/invite_visitor/presentation/ui/create/new_invite_visitor.dart';
import 'package:alufluoride/features/invite_visitor/presentation/ui/widgets/invite_visitor_list.dart';
import 'package:alufluoride/features/production_baggging_entry/model/bagging_entry_model.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/blocprovider.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_bagging_entry_cubit/create_bagging_entry_cubit.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/bloc/create_weightment_cubit/create_weightment_cubit.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/ui/create/new_bagging_entry.dart';
import 'package:alufluoride/features/production_baggging_entry/presentation/ui/widget/bagging_entry_list.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/bloc/bloc_provider.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/bloc/cubit/create_visitor_in_out_cubit.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/ui/create/new_visitor_in_out.dart';
import 'package:alufluoride/features/visitor_in_out/presentation/ui/widgets/visitor_in_out_list.dart';
import 'package:alufluoride/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouterConfig {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();

  static final GoRouter router = GoRouter(
    navigatorKey: parentNavigatorKey,
    initialLocation: AppRoute.initial.path,
    routes: <RouteBase>[
      GoRoute(
        path: AppRoute.initial.path,
        builder: (_, state) => const AppSplashScreen(),
      ),
      GoRoute(
        path: AppRoute.login.path,
        builder: (_, state) => const AuthenticationScrn(),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return AppScaffoldWidget(navigationShell: navigationShell);
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.home.path,
                builder: (_, state) => BlocProvider(
                  create: (_) =>
                      AppUpdateBlocprovider.get().appversionCubit()..request(),
                  child: const AppHomePage(),
                ),
                routes: [
                  GoRoute(
                    path: _getPath(AppRoute.gateEntry),
                    builder: (ctxt, state) => const GateEntryListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateEntry),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final provider = IncidentRegisterBlocProvider.get();
                          final gateEntryForm = state.extra as GateEntryForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      provider.companyNameList()..request()),
                              BlocProvider(
                                  create: (_) => GateEntryBlocProvider.get()
                                      .receiverAddressList()),
                              BlocProvider(
                                  create: (_) => GateEntryBlocProvider.get()
                                      .supplierNameList()
                                    ..request()),
                              BlocProvider(
                                create: (_) {
                                  final bloc = GateEntryBlocProvider.get()
                                      .fetchGateEntryLines();
                                  if (gateEntryForm != null) {
                                    bloc.request(gateEntryForm.name);
                                  }
                                  return bloc;
                                },
                              ),
                              BlocProvider(
                                create: (_) {
                                  final bloc = GateEntryBlocProvider.get()
                                      .attachmentsList();
                                  if (gateEntryForm != null) {
                                    bloc.request(gateEntryForm.name);
                                  }
                                  return bloc;
                                },
                              ),
                              BlocProvider(
                                  create: (_) => GateEntryBlocProvider.get()
                                      .receiverNameList()
                                    ..request()),
                              BlocProvider(
                                  create: (_) => $sl.get<CreateGateEntryCubit>()
                                    ..initDetails(gateEntryForm)),
                            ],
                            child: const NewGateEntry(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.gateExit),
                    builder: (ctxt, state) => const GateExitListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newGateExit),
                        builder: (_, state) {
                          final provider = GateExitBlocProvider.get();
                          final name = state.extra as String?;
                          return MultiBlocProvider(
                            providers: [
                              if (name.isNull) ...[
                                BlocProvider(
                                    create: (_) => provider.getDetails()),
                              ] else ...[
                                BlocProvider(
                                    create: (_) =>
                                        provider.getDetails()..request(name!)),
                              ],
                              BlocProvider(
                                  create: (_) => provider.getVehicleNumber()),
                              BlocProvider(
                                  create: (_) =>
                                      $sl.get<CreateGateExitCubit>()),
                            ],
                            child: const NewGateExit(),
                          );
                        },
                        routes: [
                          GoRoute(
                            path: _getPath(AppRoute.newGateExitPreview),
                            builder: (_, state) {
                              final data = state.extra as Pair<String, String?>;
                              return ImagePreviewScrn.fromPair(data);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.incidentRegister),
                    builder: (_, state) => const IncidentRegisterListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newIncidentReg),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final provider = IncidentRegisterBlocProvider.get();
                          final incRegForm =
                              state.extra as IncidentRegisterForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      provider.incidentTypeList()..request()),
                              BlocProvider(
                                  create: (_) =>
                                      provider.companyNameList()..request()),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateIncidentRegisterCubit>()
                                      ..initDetails(incRegForm),
                              ),
                            ],
                            child: const NewIncidentRegister(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.contractEmployee),
                    builder: (_, state) => const ContractEmployessList(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newContractEmployee),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final provider = ContractEmployeeBlocProvider.get();
                          final incRegForm =
                              state.extra as ContractEmployeeForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      provider.contractorsListCubit()),
                              BlocProvider(
                                  create: (_) =>
                                      $sl.get<CreateContractEmployeeCubit>()
                                        ..initDetails(incRegForm)),
                            ],
                            child: const NewContractEmployee(),
                          );
                        },
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.baggingEntry),
                    builder: (ctxt, state) => const BaggingEntryListScrn(),
                    routes: [
                      GoRoute(
                         onExit: (context, state) async =>
                            await _promptConf(context),
                        path: _getPath(AppRoute.newBaggingEntry),
                        builder: (_, state) {
                          final form = state.extra as BaggingEntryModel?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) => $sl.get<WeightmentCubit>()),
                              BlocProvider(
                                  create: (_) => BaggingEntryBlocProvider.get()
                                      .fetchItems()
                                    ..request(form?.name ?? '')),
                              BlocProvider(
                                  create: (_) =>
                                      $sl.get<CreateBaggingEntryCubit>()
                                        ..initDetails(form)),
                            ],
                            child: const NewBaggingEntry(),
                          );
                        },
                        routes: [
                          GoRoute(
                            path: _getPath(AppRoute.newBaggingEntry),
                            builder: (_, state) {
                              final data = state.extra as Pair<String, String?>;
                              return ImagePreviewScrn.fromPair(data);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.inviteVisitor),
                    builder: (ctxt, state) => const InviteVisitorListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newInviteVisitor),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final blocprovider = InviteVisitorBlocProvider.get();
                          final form = state.extra;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                create: (context) =>
                                    IncidentRegisterBlocProvider.get()
                                        .companyNameList()
                                      ..request(),
                              ),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.inviteVisitorss()),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.departmentList()..request()),
                                      BlocProvider(
                                  create: (_) => GateExitBlocProvider.get()
                                      .receiverNameList()
                                    ..request()),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateInviteVisitorCubit>()
                                      ..init(form),
                              ),
                            ],
                            child: const NewInviteVisitor(),
                          );
                        },
                      )
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.createVisit),
                    builder: (ctxt, state) => const CreateVisitListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newCreateVisit),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final blocprovider = InviteVisitorBlocProvider.get();
                          // final blocprovider2 = CreateVisitBlocProvider.get();

                          final form = state.extra as CreateVisitForm?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.inviteVisitorss()),
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.departmentList()..request()),
                              BlocProvider(
                                create: (context) =>
                                    IncidentRegisterBlocProvider.get()
                                        .companyNameList()
                                      ..request(),
                              ),
                               BlocProvider(
                                  create: (_) => GateExitBlocProvider.get()
                                      .receiverNameList()
                                    ..request()),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateVisitCubit>()..init(form),
                              ),
                            ],
                            child: const NewCreateVisit(),
                          );
                        },
                      )
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.visitorInOut),
                    builder: (ctxt, state) => const VisitorInOutListScrn(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newVisitorInOut),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final blocprovider = VisitorInOutBlocProvider.get();
                          final form = state.extra;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      blocprovider.visitorsFetching()),
                              BlocProvider(
                                create: (_) =>
                                    $sl.get<CreateVisitorInOutCubit>()
                                      ..init(form),
                              ),
                            ],
                            child: const NewVisitorInOut(),
                          );
                        },
                      )
                    ],
                  ),
                  GoRoute(
                    path: _getPath(AppRoute.baggingDispatch),
                    builder: (_, state) => const DispatchBaggingList(),
                    routes: [
                      GoRoute(
                        path: _getPath(AppRoute.newBaggingDispatch),
                        onExit: (context, state) async =>
                            await _promptConf(context),
                        builder: (_, state) {
                          final provider = DispatchBaggingBlocProvider.get();
                          final dispatch =
                              state.extra as DispatchBaggingModel?;
                          return MultiBlocProvider(
                            providers: [
                              BlocProvider(
                                  create: (_) =>
                                      provider.fetchItems()..request(dispatch?.name ?? '')),
                              BlocProvider(
                                  create: (_) =>
                                      $sl.get<CreateDispatchCubit>()
                                        ..initDetails(dispatch)),
                            ],
                            child: const NewDispatchbagging(),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoute.account.path,
                builder: (_, __) => const AppProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static Future<bool> _promptConf(BuildContext context) async {
    final promptConf = shouldAskForConfirmation.value;
    if (!promptConf) return true;
    return await AppDialog.askForConfirmation<bool?>(
          context,
          title: 'Are you sure',
          confirmBtnText: 'Yes',
          content: Messages.clearConfirmation,
          onTapConfirm: () => context.exit(true),
          onTapDismiss: () => context.exit(false),
        ) ??
        false;
  }

  static String _getPath(AppRoute route) => route.path.split('/').last;
}
