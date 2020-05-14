import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/utils/app_configuration.dart';
import 'package:portfolio/utils/route_constants.dart';


class App extends StatelessWidget {
  const App(
      {@required this.theme,
      @required this.onGenerateRoute,
      @required this.supportedLocales,
      @required this.title,
      this.startingLocale});

  final ThemeData theme;

  final RouteFactory onGenerateRoute;

  final List<Locale> supportedLocales;

  final Locale startingLocale;

  final String title;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: theme,
      localizationsDelegates: <LocalizationsDelegate<dynamic>>[
        AppConfiguration().translationsDelegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      localeResolutionCallback:
          (Locale deviceLocale, Iterable<Locale> supportedLocales) {
        if (startingLocale != null) {
          return startingLocale;
        }
        return supportedLocales.contains(deviceLocale)
            ? deviceLocale
            : supportedLocales.firstWhere(
                (local) => local.languageCode == deviceLocale.languageCode,
                orElse: () => supportedLocales.first);
      },
      supportedLocales: supportedLocales,
      initialRoute: Routes.splash,
      onGenerateRoute: onGenerateRoute,
    );
  }
}
