import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:islamii/style/my_theme_data.dart';
import 'package:islamii/ui/home/home_screen.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadith_details/hadith_details.dart';
import 'package:islamii/ui/home/tabs/quran_tab/quran_details/quran_details.dart';
import 'package:islamii/ui/splash/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SettingsProvider()
        ..getLang()
        ..getTheme(),
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<SettingsProvider>(context);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate, // Add this line
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('ar'), // Arabic
      ],
      locale: provider.locale,
      routes: {
        SplashScreen.routeName: (_) => SplashScreen(),
        HomeScreen.routeNAme: (_) => HomeScreen(),
        QuranDetailsScreen.routeName: (_) => QuranDetailsScreen(),
        HadithDetailsScreen.routeName: (_) => HadithDetailsScreen(),
      },
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: provider.themeMode,
    );
  }
}
