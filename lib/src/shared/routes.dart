import 'package:flutter/material.dart';
import 'package:task_eastern_enterprise/src/app/with_statemgmt/home_with_stmgmt.dart';
import 'package:task_eastern_enterprise/src/app/without_statemgmt/home_without_stmgmt.dart';
import 'package:task_eastern_enterprise/src/shared/choose_flow.dart';

class Routes {
  static const String chooseFlow = "ChooseFlow";
  static const String homeWithStateMgmt = "HomeWithStateMgmt";
  static const String homeWithoutStateMgmt = "HomeWithoutStateMgmt";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      switch (settings.name) {
        case chooseFlow:
          return const ChooseFlow();
        case homeWithStateMgmt:
          return const HomeWithStateMgmt();
        case homeWithoutStateMgmt:
          return const HomeWithoutStateMgmt();
        default:
          return const ChooseFlow();
      }
    });
  }
}
