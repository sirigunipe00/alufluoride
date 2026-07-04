import 'package:alufluoride/core/utils/typedefs.dart';
import 'package:alufluoride/features/visitor_in_out/model/visitor_in_out_form.dart';

abstract interface class VisitorInOutRepo {
  AsyncValueOf<List<VisitorInOutForm>> fetchVisitorInOutList(
    int start,
    int? docStatus,
    String? search,
  );
  AsyncValueOf<String> createVisitorInOut(VisitorInOutForm form);
  AsyncValueOf<String> submitVisitorInOut(String id, String time);
  AsyncValueOf<VisitorInOutForm> fetchVisitor(
    String? search,
  );
  AsyncValueOf<String> createInOut(
      String? qrcode, String? inTime);
}
