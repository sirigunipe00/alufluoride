import 'package:alufluoride/core/core.dart';
import 'package:alufluoride/features/gate_entry/data/gate_entry_repo.dart';
import 'package:alufluoride/features/gate_entry/model/customer_name_form.dart';
import 'package:alufluoride/features/gate_entry/model/gate_entry_form.dart';
import 'package:alufluoride/features/gate_entry/model/gate_entry_lines_form.dart';
import 'package:alufluoride/features/gate_entry/model/material_name_form.dart';
import 'package:alufluoride/features/gate_entry/model/vehicle_form.dart';
import 'package:alufluoride/features/gate_entry/model/vehicle_request_form.dart';

import 'package:dartz/dartz.dart';

import 'package:injectable/injectable.dart';

typedef GateEntriesCubit = InfiniteListCubit<GateEntryForm, Pair<int?, String?>, Pair<int?, String?>>;
typedef GateEntriesCubitState = InfiniteListState<GateEntryForm>;

typedef GateEntryLinesCubit = NetworkRequestCubit<List<GateEntryLinesForm>, String>;
typedef GateEntryLinesCubitState = NetworkRequestState<List<GateEntryLinesForm>>;

typedef MaterialNameList = NetworkRequestCubit<List<MaterialNameForm>, None>;
typedef MaterialNameListState = NetworkRequestState<List<MaterialNameForm>>;

typedef SupplierNameList = NetworkRequestCubit<List<SupplierNameForm>, None>;
typedef SupplierNameListState = NetworkRequestState<List<SupplierNameForm>>;

typedef VehicleRequestList = NetworkRequestCubit<List<VehcileRequestForm>, None>;
typedef VehicleRequestListState = NetworkRequestState<List<VehcileRequestForm>>;


typedef VehicleList = NetworkRequestCubit<List<VehcileForm>, None>;
typedef VehicleListState = NetworkRequestState<List<VehcileForm>>;

typedef AttachmentsList = NetworkRequestCubit<List<String>, String>;
typedef AttachmentsListState = NetworkRequestState<List<String>>;


// typedef DeleteLines = NetworkRequestCubit<String, Pair<String ,List<String>>>;
// typedef DeleteLinesState = NetworkRequestState<String>;

@lazySingleton
class GateEntryBlocProvider {
  const GateEntryBlocProvider(this.repo);

  final GateEntryRepo repo;

  static GateEntryBlocProvider get() => $sl.get<GateEntryBlocProvider>();

  GateEntriesCubit fetchGateEntries() => GateEntriesCubit(
    requestInitial: (params, state) => repo.fetchEntries(0, params!.first, params.second),
    requestMore: (params, state) => repo.fetchEntries(state.curLength, params!.first, params.second),
  );

  GateEntryLinesCubit fetchGateEntryLines() => GateEntryLinesCubit(
    onRequest: (params, state) => repo.fetchEntriesLines(params!),
  );

  MaterialNameList materialNameList() => MaterialNameList(onRequest: (_, state) => repo.materialName());

  SupplierNameList supplierNameList() => SupplierNameList(onRequest: (_, state) => repo.supplierName());

  VehicleRequestList vehicleRequestCubit() => VehicleRequestList(
    onRequest: (_, state) => repo.fetchVechicleEntries()

  );

    VehicleList vehicleListCubit() => VehicleList(
    onRequest: (_, state) => repo.fetchVehicleList()

  );

  AttachmentsList attachmentsList() => AttachmentsList(
    onRequest:(params, state) => repo.fetchAttachments(params!), );

    // DeleteLines removeGaylord() => DeleteLines(
    // onRequest:(params, state) =>repo.deleteLines(params!.first, params.second));


}
