import 'package:alufluoride/core/model/page_view_filters.dart';
import 'package:alufluoride/core/model/pair.dart';
import 'package:alufluoride/core/utils/typedefs.dart';
import 'package:alufluoride/features/gate_exit/model/gate_exit.dart';
import 'package:alufluoride/features/gate_exit/model/new_gate_exit_form.dart';


abstract interface class GateExitRepo {
  AsyncValueOf<List<GateExit>> fetchGateExits(int start, int end, PageViewFilters filters);
  AsyncValueOf<GateExit> getGateExit(String name);

  AsyncValueOf<String?> getvehicleNumber(String siNumber);
  AsyncValueOf<Pair<String, String>> createGateExit(NewGateExitForm form);
  AsyncValueOf<Pair<String, String>>submitGateExit(NewGateExitForm form);
}