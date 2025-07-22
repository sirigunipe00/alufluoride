import 'package:alufluoride/core/model/pair.dart';
import 'package:alufluoride/core/utils/typedefs.dart';
import 'package:alufluoride/features/contract_employee/model/contract_employee_form.dart';
import 'package:alufluoride/features/contract_employee/model/contractors_form.dart';

abstract interface class ContractEmployeeRepo {
  AsyncValueOf<List<ContractEmployeeForm>> fetchEmployees(
    int start,
    int? docStatus,
    String? search,
  );

  AsyncValueOf<List<ContractorsForm>> fetchContractors();

  AsyncValueOf<Pair<String, String>> createContractEmployee(
      ContractEmployeeForm form);
  AsyncValueOf<Pair<String, String>> submitContractEmployee(
      ContractEmployeeForm form);
  AsyncValueOf<String> updateContractEmployee(
    ContractEmployeeForm form,
  );
}
