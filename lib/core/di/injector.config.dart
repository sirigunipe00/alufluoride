// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../app/data/app_repository.dart' as _i691;
import '../../app/data/app_version.dart' as _i346;
import '../../app/presentation/app_update_blocprovider.dart' as _i266;
import '../../features/auth/data/auth_repo.dart' as _i585;
import '../../features/auth/data/auth_repo_impl.dart' as _i328;
import '../../features/auth/presentation/bloc/auth/auth_cubit.dart' as _i190;
import '../../features/auth/presentation/bloc/sign_in/sign_in_cubit.dart'
    as _i140;
import '../../features/contract_employee/data/contract_employee_repo.dart'
    as _i908;
import '../../features/contract_employee/data/contract_employee_repo_impl.dart'
    as _i1017;
import '../../features/contract_employee/presentation/bloc/bloc_provider.dart'
    as _i46;
import '../../features/contract_employee/presentation/bloc/create_contract_employee/contract_employee_cubit.dart'
    as _i400;
import '../../features/Create%20Visit/data/create_visit_repo.dart' as _i148;
import '../../features/Create%20Visit/data/create_visit_repo_impl.dart'
    as _i219;
import '../../features/Create%20Visit/presentation/bloc/bloc_provider.dart'
    as _i1038;
import '../../features/Create%20Visit/presentation/bloc/cubit/create_visit_cubit.dart'
    as _i881;
import '../../features/dispatch_bagging/data/dispatch_bagging_repo.dart'
    as _i920;
import '../../features/dispatch_bagging/data/dispatch_bagging_repoimpl.dart'
    as _i779;
import '../../features/dispatch_bagging/presentation/bloc/bloc_provider.dart'
    as _i583;
import '../../features/dispatch_bagging/presentation/bloc/create_dispatch_cubit/create_dispatch_cubit.dart'
    as _i82;
import '../../features/gate_entry/data/gate_entry_repo.dart' as _i820;
import '../../features/gate_entry/data/gate_entry_repo_impl.dart' as _i174;
import '../../features/gate_entry/presentation/bloc/bloc_provider.dart'
    as _i210;
import '../../features/gate_entry/presentation/bloc/create_gate_entry/gate_entry_cubit.dart'
    as _i224;
import '../../features/gate_exit/data/gate_exit_repo.dart' as _i495;
import '../../features/gate_exit/data/gate_exit_repo_impl.dart' as _i100;
import '../../features/gate_exit/presentation/bloc/bloc_provider.dart' as _i565;
import '../../features/gate_exit/presentation/bloc/create_gate_exit/create_gate_exit_cubit.dart'
    as _i161;
import '../../features/incident_register/data/incident_register_repo.dart'
    as _i310;
import '../../features/incident_register/data/incident_register_repo_impl.dart'
    as _i49;
import '../../features/incident_register/presentation/bloc/bloc_provider.dart'
    as _i840;
import '../../features/incident_register/presentation/bloc/create_incident_register/incident_register_cubit.dart'
    as _i816;
import '../../features/invite_visitor/data/invite_visitor_repo.dart' as _i870;
import '../../features/invite_visitor/data/invite_visitor_repo_impl.dart'
    as _i872;
import '../../features/invite_visitor/presentation/bloc/bloc_provider.dart'
    as _i881;
import '../../features/invite_visitor/presentation/bloc/cubit/create_invite_visitor_cubit.dart'
    as _i597;
import '../../features/production_baggging_entry/data/bagging_entry_repo.dart'
    as _i876;
import '../../features/production_baggging_entry/data/bagging_entry_repoimpl.dart'
    as _i457;
import '../../features/production_baggging_entry/presentation/bloc/blocprovider.dart'
    as _i290;
import '../../features/production_baggging_entry/presentation/bloc/create_bagging_entry_cubit/create_bagging_entry_cubit.dart'
    as _i610;
import '../../features/production_baggging_entry/presentation/bloc/create_weightment_cubit/create_weightment_cubit.dart'
    as _i571;
import '../../features/visitor_in_out/data/visitor_in_out_repo.dart' as _i999;
import '../../features/visitor_in_out/data/visitor_in_out_repo_impl.dart'
    as _i103;
import '../../features/visitor_in_out/presentation/bloc/bloc_provider.dart'
    as _i743;
import '../../features/visitor_in_out/presentation/bloc/cubit/create_visitor_in_out_cubit.dart'
    as _i784;
import '../core.dart' as _i351;
import '../local_storage/key_vale_storage.dart' as _i1012;
import '../network/api_client.dart' as _i557;
import '../network/internet_check.dart' as _i402;
import 'injector.dart' as _i811;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyDependencies = _$ThirdPartyDependencies();
    gh.factory<DateTime>(() => thirdPartyDependencies.defaultDateTime);
    gh.singleton<_i519.Client>(() => thirdPartyDependencies.httpClient);
    gh.singleton<_i895.Connectivity>(() => thirdPartyDependencies.connectivity);
    gh.singleton<_i558.FlutterSecureStorage>(
        () => thirdPartyDependencies.secureStorage);
    await gh.singletonAsync<_i655.PackageInfo>(
      () => thirdPartyDependencies.packageInfo,
      preResolve: true,
    );
    await gh.singletonAsync<_i460.SharedPreferences>(
      () => thirdPartyDependencies.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i402.InternetConnectionChecker>(
        () => _i402.InternetConnectionChecker(gh<_i895.Connectivity>()));
    gh.factory<_i1012.KeyValueStorage>(() => _i1012.KeyValueStorage(
          gh<_i558.FlutterSecureStorage>(),
          gh<_i460.SharedPreferences>(),
        ));
    gh.factory<_i557.ApiClient>(() => _i557.ApiClient(
          gh<_i519.Client>(),
          gh<_i402.InternetConnectionChecker>(),
        ));
    gh.lazySingleton<_i346.AppVersion>(
        () => _i346.AppVersion(gh<_i655.PackageInfo>()));
    gh.lazySingleton<_i908.ContractEmployeeRepo>(
        () => _i1017.ContractEmployeeRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i148.CreateVisitRepo>(
        () => _i219.CreateVisitRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i870.InviteVisitorRepo>(
        () => _i872.InviteVisitorRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i310.IncidentRegistersRepo>(
        () => _i49.IncidentRegistersRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i920.DispatchBaggingRepo>(
        () => _i779.DispatchBaggingRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i876.BaggingEntryRepo>(
        () => _i457.BaggingEntryRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i999.VisitorInOutRepo>(
        () => _i103.VisitorInOutRepoImpl(gh<_i351.ApiClient>()));
    gh.factory<_i82.CreateDispatchCubit>(
        () => _i82.CreateDispatchCubit(gh<_i920.DispatchBaggingRepo>()));
    gh.lazySingleton<_i583.DispatchBaggingBlocProvider>(() =>
        _i583.DispatchBaggingBlocProvider(gh<_i920.DispatchBaggingRepo>()));
    gh.lazySingleton<_i1038.CreateVisitBlocProvider>(
        () => _i1038.CreateVisitBlocProvider(gh<_i148.CreateVisitRepo>()));
    gh.factory<_i881.CreateVisitCubit>(
        () => _i881.CreateVisitCubit(gh<_i148.CreateVisitRepo>()));
    gh.lazySingleton<_i290.BaggingEntryBlocProvider>(
        () => _i290.BaggingEntryBlocProvider(gh<_i876.BaggingEntryRepo>()));
    gh.factory<_i571.WeightmentCubit>(
        () => _i571.WeightmentCubit(gh<_i876.BaggingEntryRepo>()));
    gh.factory<_i610.CreateBaggingEntryCubit>(
        () => _i610.CreateBaggingEntryCubit(gh<_i876.BaggingEntryRepo>()));
    gh.lazySingleton<_i46.ContractEmployeeBlocProvider>(() =>
        _i46.ContractEmployeeBlocProvider(gh<_i908.ContractEmployeeRepo>()));
    gh.factory<_i400.CreateContractEmployeeCubit>(() =>
        _i400.CreateContractEmployeeCubit(gh<_i908.ContractEmployeeRepo>()));
    gh.lazySingleton<_i840.IncidentRegisterBlocProvider>(() =>
        _i840.IncidentRegisterBlocProvider(gh<_i310.IncidentRegistersRepo>()));
    gh.factory<_i816.CreateIncidentRegisterCubit>(() =>
        _i816.CreateIncidentRegisterCubit(gh<_i310.IncidentRegistersRepo>()));
    gh.lazySingleton<_i495.GateExitRepo>(
        () => _i100.GateExitRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i820.GateEntryRepo>(
        () => _i174.GateEntryRepoImpl(gh<_i351.ApiClient>()));
    gh.lazySingleton<_i565.GateExitBlocProvider>(
        () => _i565.GateExitBlocProvider(gh<_i495.GateExitRepo>()));
    gh.factory<_i161.CreateGateExitCubit>(
        () => _i161.CreateGateExitCubit(gh<_i495.GateExitRepo>()));
    gh.factory<_i597.CreateInviteVisitorCubit>(
        () => _i597.CreateInviteVisitorCubit(gh<_i870.InviteVisitorRepo>()));
    gh.lazySingleton<_i881.InviteVisitorBlocProvider>(
        () => _i881.InviteVisitorBlocProvider(gh<_i870.InviteVisitorRepo>()));
    gh.lazySingleton<_i691.AppRepository>(() => _i691.AppRepository(
          gh<_i351.ApiClient>(),
          gh<_i346.AppVersion>(),
        ));
    gh.factory<_i784.CreateVisitorInOutCubit>(
        () => _i784.CreateVisitorInOutCubit(gh<_i999.VisitorInOutRepo>()));
    gh.lazySingleton<_i743.VisitorInOutBlocProvider>(
        () => _i743.VisitorInOutBlocProvider(gh<_i999.VisitorInOutRepo>()));
    gh.lazySingleton<_i585.AuthRepo>(() => _i328.AuthRepoImpl(
          gh<_i351.ApiClient>(),
          gh<_i351.KeyValueStorage>(),
        ));
    gh.factory<_i224.CreateGateEntryCubit>(
        () => _i224.CreateGateEntryCubit(gh<_i820.GateEntryRepo>()));
    gh.lazySingleton<_i210.GateEntryBlocProvider>(
        () => _i210.GateEntryBlocProvider(gh<_i820.GateEntryRepo>()));
    gh.factory<_i140.SignInCubit>(
        () => _i140.SignInCubit(gh<_i585.AuthRepo>()));
    gh.factory<_i190.AuthCubit>(() => _i190.AuthCubit(gh<_i585.AuthRepo>()));
    gh.lazySingleton<_i266.AppUpdateBlocprovider>(
        () => _i266.AppUpdateBlocprovider(gh<_i691.AppRepository>()));
    return this;
  }
}

class _$ThirdPartyDependencies extends _i811.ThirdPartyDependencies {}
