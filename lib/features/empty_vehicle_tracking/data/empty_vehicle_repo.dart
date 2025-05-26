import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/empty_vehicle_tracking/model/empty_vehicle_form.dart';
import 'package:alufluoride/features/gate_entry/model/customer_name_form.dart';

abstract interface class EmptyVehicleRepo {
  AsyncValueOf<List<EmptyVehicleForm>> fetchEmptyVehicleList(
    int start,
    int? docStatus,
    String? search,
  );

  AsyncValueOf<Pair<String, String>> createEmptyVehicle(
      EmptyVehicleForm form);
       AsyncValueOf<String> updateEmptyVehicle(
      EmptyVehicleForm form);
  AsyncValueOf<String> submitEmptyVehicle(EmptyVehicleForm form);
  AsyncValueOf<List<SupplierNameForm>> supplierName();
}
