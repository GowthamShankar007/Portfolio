import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pedantic/pedantic.dart';
import 'package:provider/provider.dart';

import 'app.dart';
import 'locale/localizations.dart';
import 'utils/app_configuration.dart';

enum AppEnvironment { DEVELOPMENT, PRODUCTION, QA, STAGING }
enum Flavor { BASE }

class BaseApp {
  static Future<void> initialize({
    @required ThemeData theme,
    @required onGenerateRoute,
    @required supportedLocales,
    @required AppEnvironment environment,
    @required Flavor flavor,
    @required Locale startingLocale,
    @required String baseUrl,
    Widget logoWidget,
    @required isGuestFlowEnabled,
    @required List<SingleChildCloneableWidget> modules,
    @required String title,
  }) async {
    final App app = App(
        theme: theme,
        onGenerateRoute: onGenerateRoute,
        supportedLocales: supportedLocales,
        startingLocale: startingLocale,
        title: title);
    AppConfiguration().init(
      environment: environment,
      flavor: flavor,
      baseUrl: baseUrl,
      supportedLocals: supportedLocales,
      isGuestFlowEnabled: isGuestFlowEnabled,
      translationsDelegate: TranslationsDelegate(),
    );

    unawaited(
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]));

    unawaited(runZoned<Future<void>>(() async {
      runApp(app);
/*
      runApp(MultiProvider(
        providers: modules,
        child: app,
      ));
*/
    }, onError: (error) {
      print(error);
    }));
  }
}
