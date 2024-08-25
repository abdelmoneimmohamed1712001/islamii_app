import 'package:flutter/material.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

import '../home/home_screen.dart';

class SplashScreen extends StatelessWidget {
  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    var myThemeProvider = Provider.of<SettingsProvider>(context);
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.pushReplacementNamed(context, HomeScreen.routeNAme);
      },
    );
    return Scaffold(
      body: Image.asset(
        myThemeProvider.themeMode == ThemeMode.light
            ? 'assets/images/splash.jpg'
            : 'assets/images/splash_dark.png',
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
