import 'package:flutter/material.dart';
import 'package:portfolio/utils/api_config.dart';
import 'package:portfolio/utils/app_constants.dart';
import 'package:provider/provider.dart';

import 'base_app.dart';
import 'routes_manager.dart' as routes;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeData theme = getTheme();

  BaseApp.initialize(
      theme: theme,
      onGenerateRoute: routes.onGenerateRoute,
      supportedLocales: AppConstants.supportedLocals,
      environment: AppEnvironment.DEVELOPMENT,
      flavor: Flavor.BASE,
      baseUrl: ApiConfig.baseUrl,
      modules: getModules(),
      isGuestFlowEnabled: true,
      logoWidget: Container(),
      title: AppConstants.appName,
      startingLocale: Locale("en", "EN"));
}

ThemeData getTheme() {
  return ThemeData(
      fontFamily: "Roboto",
      primaryColor: Color.fromRGBO(0, 205, 222, 1),
      primaryColorLight: Color.fromRGBO(25, 40, 191, 1),
      accentColor: Color.fromRGBO(175, 239, 0, 1),
      indicatorColor: Color.fromRGBO(0, 118, 255, 1),
      backgroundColor: Color.fromRGBO(249, 249, 249, 1));
}

List<SingleChildCloneableWidget> getModules() {
  List<SingleChildCloneableWidget> providers = [];

  return providers;
}

