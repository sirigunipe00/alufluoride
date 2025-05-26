import 'package:alufluoride/app/data/app_repository.dart';
import 'package:alufluoride/core/cubit/network_request/network_request_cubit.dart';
import 'package:alufluoride/core/di/injector.dart';
import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

typedef AppVersionCubit = NetworkRequestCubit<bool, None>;
typedef AppVersionCubitState = NetworkRequestState<bool>;

@lazySingleton
class AppUpdateBlocprovider {
  AppUpdateBlocprovider(this.repository);

  final AppRepository repository;

  static AppUpdateBlocprovider get() => $sl.get<AppUpdateBlocprovider>();

  AppVersionCubit appversionCubit() => NetworkRequestCubit(
      onRequest: (_, state) => repository.isAppUpdateAvailable());
}
