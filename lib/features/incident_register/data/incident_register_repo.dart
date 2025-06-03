import 'package:alufluoride/core/model/pair.dart';
import 'package:alufluoride/core/utils/typedefs.dart';
import 'package:alufluoride/features/incident_register/model/incident_register_form.dart';

abstract interface class IncidentRegistersRepo {
  AsyncValueOf<List<IncidentRegisterForm>> fetchIncidentRegister(
    int start,
    int? docStatus,
    String? search,
  );

  AsyncValueOf<List<String>> companyName();
  AsyncValueOf<List<String>> incidentType();

  AsyncValueOf<Pair<String, String>> createIncentRegister(
      IncidentRegisterForm form);
  AsyncValueOf<String> submitIncidentRegister(String id);
}
