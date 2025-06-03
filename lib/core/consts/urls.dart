import 'package:alufluoride/core/di/injector.dart';

final _reqisteredUrl = $sl.get<Urls>(instanceName: 'baseUrl');

class Urls {
  factory Urls.alufluorideUAT() =>
      const Urls('https://alufluorideuat.easycloud.co.in/api');
  factory Urls.local() => const Urls('192.168.0.147:8000/api');
  factory Urls.alufluorideLive() =>
      const Urls('https://alufluoridegmlive.easycloud.co.in/api');

  const Urls(this.url);

  final String url;

  static bool get isTest => Uri.parse(_reqisteredUrl.url)
      .authority
      .split('.')
      .first
      .toLowerCase()
      .contains('uat');

  static final baseUrl = _reqisteredUrl.url;
  static final jsonWs = '$baseUrl/resource';
  static final cusWs = '$baseUrl/method';
  static final uploadFiles = '$cusWs/alufluoride.api.upload_files';

  static final appUpdate = '$cusWs/easy_common.api.get_app_version';

  static final login = '$cusWs/login';
  static final getUsers = '$cusWs/alufluoride.contractor_api.getUsers';
  static final getList = '$cusWs/frappe.client.get_list';
  static final getOutwardList = '$cusWs/frappe.client';
  static final createGateEntry = '$cusWs/alufluoride.api.createGateEntry';
  static final submitGateEntry = '$cusWs/alufluoride.api.submit_gate_entry';
  static final gateExitList = '$cusWs/alufluoride.api.getGateExit';
  static final getGateExit = '$cusWs/alufluoride.api.getGateExitDetails';
  static final newGateExit = '$cusWs/alufluoride.api.createGateExit';
  static final submitGateExit = '$cusWs/alufluoride.api.submitGateExit';
  static final getVehicleNumber =
      '$cusWs/easygateentry.api.getvehiclenumberfromsalesinvoice';
  static final poList = '$cusWs/easygateentry.api.po_list';
  static final createInviteVisitor =
      '$cusWs/alufluoride.api.create_invite_visitor';
  static final submitInviteVisitor =
      '$cusWs/alufluoride.api.submit_invite_visitor';
  static final updateGateEntry = '$cusWs/alufluoride.api.update_gate_entry';
  static final updateGateExit = '$cusWs/alufluoride.api.update_gate_exit';
  static final deleteLines = '$cusWs/alufluoride.api.remove_lines';

  static final createGateExit = '$cusWs/alufluoride.api.create_gate_exit';
  // static final submitGateExit = '$cusWs/alufluoride.api.submit_gate_Exit';
  static final receiverAddress = '$cusWs/alufluoride.api.get_address';
  static final supplierName = '$jsonWs/Supplier';
  static final customerName = '$jsonWs/Customer';
  static final companyName = '$jsonWs/Company';
  static final department = '$jsonWs/Department';
  static final incidentType = '$jsonWs/Incident Type';
  static final defaultGateEntry = '$jsonWs/Gate Entry';
  static final defaultGateExit = '$jsonWs/Gate Exit';
  static final defaultOutward = '$jsonWs/Outward Gate Pass RGP';
  static final defaultInward = '$jsonWs/Inward Gate Pass RGP';
  static final item = '$jsonWs/Item';
  static final uomList = '$jsonWs/UOM';
  static final outwardlist = '$cusWs/alufluoride.api.get_outwards_for_inward';

  static final createIncidentRegister =
      '$cusWs/alufluoride.api.create_incident_register';
  static final submitIncidentRegister =
      '$cusWs/alufluoride.api.submit_incident_register';

  static final createVisitorInOut = '$cusWs/alufluoride.api.create_in_out';
  static final submitVisitorInOut = '$cusWs/alufluoride.api.submit_in_out';

  static final getVisitors = '$cusWs/alufluoride.api.get_visitors';
  static final createVisit = '$cusWs/alufluoride.api.create_visit';
  static final submitVisit = '$cusWs/alufluoride.api.submit_create_visit';
  static final approvalWorkFlow = '$cusWs/frappe.model.workflow.apply_workflow';
  static final userPermission =
      '$cusWs/alufluoride.api.check_user_permission_for_visit_approval';

  static final createOutward = '$cusWs/alufluoride.api.create_outward_gatepass';
  static final updateOutward = '$cusWs/alufluoride.api.update_outward_gatepass';
  static final submitOutward = '$cusWs/alufluoride.api.submit_outward_gatepass';

  static final createInward = '$cusWs/alufluoride.api.create_inward_gatepass';
  static final updateInward = '$cusWs/alufluoride.api.update_inward_gatepass';
  static final submitInward = '$cusWs/alufluoride.api.submit_inward_gatepass';

  static final createEmptyVehicle =
      '$cusWs/alufluoride.api.create_empty_vehicle_tracking';
  static final updateEmptyVehicle =
      '$cusWs/alufluoride.api.update_empty_vehicle_tracking';
  static final submitEmptyVehicle =
      '$cusWs/alufluoride.api.submit_empty_vehicle_tracking';

  static final removelines =
      '$cusWs/alufluoride.api.remove_outward_or_inward_items';

  static filepath(String path) {
    return '${baseUrl.replaceAll('api', '')}/${path.replaceAll('/private', '').replaceAll("///", '/')}';
  }
}
