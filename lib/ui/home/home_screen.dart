import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islamii/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islamii/ui/home/tabs/radio_tab/radio_tab.dart';
import 'package:islamii/ui/home/tabs/settings_tab/settings_tab.dart';
import 'package:islamii/ui/home/tabs/tasbeh_tab/tasbeh_tab.dart';
import 'package:provider/provider.dart';

import '../../utils/image_utils.dart';

class HomeScreen extends StatefulWidget {
  static const String routeNAme = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var myThemeProvider = Provider.of<SettingsProvider>(context);
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(getImagePathByName(
            imageName: myThemeProvider.themeMode == ThemeMode.light
                ? 'main_background.png'
                : 'home_dark_background.png')),
      )),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            AppLocalizations.of(context)!.app_title,
          ),
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Theme.of(context).colorScheme.secondary,
          ),
          child: BottomNavigationBar(
            currentIndex: selectedIndex, // 1
            onTap: (index) {
              // 2
              selectedIndex = index; // 2
              setState(() {});
            },
            items: [
              BottomNavigationBarItem(
                  //backgroundColor: Color(0xFFB7935F),
                  icon: ImageIcon(
                      AssetImage(getImagePathByName(imageName: 'quran.png'))),
                  label: AppLocalizations.of(context)!.quran),
              BottomNavigationBarItem(
                  //backgroundColor: Color(0xFFB7935F),

                  icon: ImageIcon(AssetImage(
                      getImagePathByName(imageName: 'hadeth_ic.png'))),
                  label: AppLocalizations.of(context)!.hadith),
              BottomNavigationBarItem(
                  //backgroundColor: Color(0xFFB7935F),

                  icon: ImageIcon(
                      AssetImage(getImagePathByName(imageName: 'sebha.png'))),
                  label: AppLocalizations.of(context)!.tasbeh),
              BottomNavigationBarItem(
                  // backgroundColor: Color(0xFFB7935F),

                  icon: ImageIcon(
                      AssetImage(getImagePathByName(imageName: 'radio.png'))),
                  label: AppLocalizations.of(context)!.radio),
              BottomNavigationBarItem(
                  // backgroundColor: Color(0xFFB7935F),

                  icon: Icon(Icons.settings),
                  label: AppLocalizations.of(context)!.settings),
            ],
          ),
        ),
        body: tabs[selectedIndex],
      ),
    );
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    TasbehTab(),
    RadioTab(),
    SettingsTab()
  ];
}
