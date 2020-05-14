import 'package:flutter/material.dart';
import 'package:portfolio/locale/localizations.dart';
import 'package:portfolio/utils/string_resources.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _StateSplashScreen();
}

class _StateSplashScreen extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Text(
          Translations.of(context).text(StringResources.welcome),
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.white,
    ));
  }
}
