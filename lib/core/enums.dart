import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wist/core/routing/app_route.dart';

enum AuthTypeEnum { user, admin, driver }

enum UserState { Active, Block, Pending }

enum AmublanceEnum { Medical, Accident, Fire, Other }

List<Map<String, String>> AmublanceMap = [
  {"title": "accident", "value": "0"},
  {"title": "fire", "value": "1"},
  {"title": "medical", "value": "2"},
  {"title": "other", "value": "3"},
  
];

enum OrderState { PENDING, COMPLETED, CANCELED }

abstract class AuthType {
  void redirectTo(
    BuildContext context,
  );
}

class UserAuthType implements AuthType {
  static int id = 0;

  @override
  void redirectTo(BuildContext context) {
    GoRouter.of(context).push(AppRoute.KBookAnAmbulance);
  }
}

class AdminAuthType implements AuthType {
  static int id = 1;

  @override
  void redirectTo(BuildContext context) {
    GoRouter.of(context).push(AppRoute.KAminHome);
  }
}

class DriverAuthType implements AuthType {
  static int id = 2;

  @override
  void redirectTo(BuildContext context) {
    GoRouter.of(context).push(AppRoute.KDriverPending);
  }
}
