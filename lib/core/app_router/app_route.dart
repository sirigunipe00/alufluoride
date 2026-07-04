import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

abstract class _AppRoutePaths {
  static const initial = '/';
  static const login = '/login';
  static const home = '/home';
  static const gateEntry = '/home/gateentry';
  static const newGateEntry = '/home/gateentry/newGateEntry';
  static const gateExit = '/home/gateexit';
  static const newGateExit = '/home/gateexit/newGateExit';
  static const newGateExitPreview = '/home/gateexit/newGateExit/preview';
  static const incidentRegister = '/home/incidentRegister';
  static const newIncidentReg = '/home/incidentRegister/newIncReg';
  static const contractEmployee = '/home/contractEmployee';
  static const newContractEmployee='/home/contractEmployee/newContractEmployee';
  static const baggingEntry = '/home/baggingEntry';
  static const newBaggingEntry='/home/baggingEntry/newBaggingEntry';
  static const baggingDispatch = '/home/baggingDispatch';
  static const newBaggingDispatch = '/home/baggingDispatch/newBaggingDispatch';
  static const inviteVisitor = '/home/inviteVisitor';
  static const newInviteVisitor = '/home/inviteVisitor/newInviteVisitor';
  static const visitorInOut = '/home/visitorInOut';
  static const newVisitorInOut = '/home/visitorInOut/newVisitorInOut';
  static const createVisit = '/home/createVisit';
  static const newCreateVisit = '/home/createVisit/newCreateVisit';

  static const account = '/account';
}

enum AppRoute {
  initial(_AppRoutePaths.initial),
  login(_AppRoutePaths.login),
  home(_AppRoutePaths.home),
  gateEntry(_AppRoutePaths.gateEntry),
  newGateEntry(_AppRoutePaths.newGateEntry),
  gateExit(_AppRoutePaths.gateExit),
  newGateExit(_AppRoutePaths.newGateExit),
  newGateExitPreview(_AppRoutePaths.newGateExitPreview),
  incidentRegister(_AppRoutePaths.incidentRegister),
  newIncidentReg(_AppRoutePaths.newIncidentReg),
  contractEmployee(_AppRoutePaths.contractEmployee),
  newContractEmployee(_AppRoutePaths.newContractEmployee),
  baggingEntry(_AppRoutePaths.baggingEntry),
  newBaggingEntry(_AppRoutePaths.newBaggingEntry),
  baggingDispatch(_AppRoutePaths.baggingDispatch),
  newBaggingDispatch(_AppRoutePaths.newBaggingDispatch),
  inviteVisitor(_AppRoutePaths.inviteVisitor),
  newInviteVisitor(_AppRoutePaths.newInviteVisitor),
  visitorInOut(_AppRoutePaths.visitorInOut),
  newVisitorInOut(_AppRoutePaths.newVisitorInOut),
  createVisit(_AppRoutePaths.createVisit),
  newCreateVisit(_AppRoutePaths.newCreateVisit),

  account(_AppRoutePaths.account);

  const AppRoute(this.path);
  final String path;
}

extension AppRouteNavigation on AppRoute {
  void go(BuildContext context, {Object? extra}) {
    context.go(path, extra: extra);
  }

  void goNamed(BuildContext context, {Object? extra}) {
    context.goNamed(path, extra: extra);
  }

  Future<T?> push<T>(BuildContext context, {Object? extra}) async {
    return await context.push(path, extra: extra);
  }
}
