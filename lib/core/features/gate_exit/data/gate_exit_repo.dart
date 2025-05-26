import 'package:alufluoride/core/utils/typedefs.dart';
import 'package:alufluoride/features/gate_entry/model/gate_entry_lines_form.dart';
import 'package:alufluoride/features/gate_exit/model/gate_exit_form.dart';
import 'package:alufluoride/features/gate_exit/model/receiver_address_form.dart';
import 'package:alufluoride/features/gate_exit/model/receiver_name_form.dart';


abstract interface class GateExitRepo {
  AsyncValueOf<List<GateExitForm>> fetchExits(
    int start,
    int? docStatus,
    String? search,);
  AsyncValueOf<String> createGateExit(GateExitForm form, List<GateEntryLinesForm> lines);
  AsyncValueOf<String> submitGateExit(GateExitForm form, List<GateEntryLinesForm> lines);
  AsyncValueOf<List<GateEntryLinesForm>> fetchExitLines(String itemName,);
  AsyncValueOf<String> updateGateExit(GateExitForm form,List<GateEntryLinesForm> lines,);
  AsyncValueOf<List<ReceiverAddressForm>> receiverAddress(String id);
  AsyncValueOf<List<ReceiverNameForm>> receiverName();
}
