import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:portfolio/locale/localizations.dart';

import '../base_app.dart';
import 'app_preferences.dart';

class AppConfiguration {
  // next three lines makes this class a Singleton
  static AppConfiguration _instance = AppConfiguration._internal();

  AppConfiguration._internal();

  factory AppConfiguration() => _instance;

  String _appName;
  bool _loginStatus;
  AppEnvironment _environment;
  Flavor _flavor;
  String _baseUrl;
  List<Locale> _supportedLocals;
  Locale _currentLocale;
  bool _isGuestFlowEnabled;
  TranslationsDelegate _translationsDelegate;
  String _apiKey;

  Future<void> init({
    @required AppEnvironment environment,
    @required Flavor flavor,
    @required String baseUrl,
    @required isGuestFlowEnabled,
    @required translationsDelegate,
    @required supportedLocals,
  }) async {
    assert(baseUrl != null);
    _baseUrl = baseUrl;
    _environment = environment;
    _flavor = flavor;
    _isGuestFlowEnabled = isGuestFlowEnabled;
    _supportedLocals = supportedLocals;
    _translationsDelegate = translationsDelegate;
    await readPropertiesFromPreferences();
  }

  Future<void> readPropertiesFromPreferences() async {
    _loginStatus = await AppPreferences.getLoginStatus();
  }

  String get apiKey => _apiKey;

  String get appName => _appName;

  bool get isUserLoggedIn => _loginStatus;

  AppEnvironment get currentEnvironment => _environment;

  Flavor get flavor => _flavor;

  String get flavorName => _flavor
      .toString()
      .substring(_flavor.toString().indexOf('.') + 1)
      .toLowerCase();

  String get baseUrl => _baseUrl;

  String get currentLanguage => _currentLocale.languageCode;

  bool get isGuestFlowEnabled => _isGuestFlowEnabled;

  List<Locale> get supportedLocals => _supportedLocals;

  TranslationsDelegate get translationsDelegate => _translationsDelegate;

  Locale get currentLocale => _currentLocale;

  void changeCurrentLocale(Locale locale) {
    assert(locale != null);
    _currentLocale = locale;
  }

  Future<Locale> setUserLanguage() async {
    String language = await AppPreferences.getUserLanguage();
    if (language != null && language.isNotEmpty) {
      final List<String> locale = language.split('_');
      return Locale(locale[0], locale[1]);
    }
    return null;
  }

  void setUserIsLoggedIn() {
    _loginStatus = true;
    AppPreferences.setLoginStatus(true);
  }

  void setIsGuestFlowEnabled() {
    _isGuestFlowEnabled = true;
    AppPreferences.setGuestFlowStatus(true);
  }

  Future<void> setUserIsLoggedOut() async {
    await AppPreferences.logoutClearPreferences();
    await readPropertiesFromPreferences();
  }
}
