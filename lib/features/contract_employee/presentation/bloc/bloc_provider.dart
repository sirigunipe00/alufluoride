import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/contract_employee/data/contract_employee_repo.dart';
import 'package:alufluoride/features/contract_employee/model/contract_employee_form.dart';
import 'package:alufluoride/features/contract_employee/model/contractors_form.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

typedef ContractEmployeesCubit = InfiniteListCubit<ContractEmployeeForm,
    Pair<int?, String?>, Pair<int?, String?>>;
typedef ContractEmployeesCubitState = InfiniteListState<ContractEmployeeForm>;

typedef ContractorsList =NetworkRequestCubit<List<ContractorsForm>, None>;
typedef ContractorsListState =NetworkRequestState<List<ContractorsForm>>;

@lazySingleton
class ContractEmployeeBlocProvider {
  const ContractEmployeeBlocProvider(this.repo);
  final ContractEmployeeRepo repo;

  static ContractEmployeeBlocProvider get() =>
      $sl.get<ContractEmployeeBlocProvider>();
  ContractEmployeesCubit fetchEmployees() => ContractEmployeesCubit(
        requestInitial: (params, state) =>
            repo.fetchEmployees(0, params!.first, params.second),
        requestMore: (params, state) =>
            repo.fetchEmployees(state.curLength, params!.first, params.second),
      );
      ContractorsList contractorsListCubit()=> ContractorsList(
     onRequest:(_, state)=> repo.fetchContractors()
       
      );

  
}

