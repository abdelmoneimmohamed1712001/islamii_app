import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:islamii/utils/image_utils.dart';
import 'package:provider/provider.dart';

class TasbehTab extends StatefulWidget {
  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int count = 0;
  int index = 0;
  double angle = 0;

  List<String> tasbehWords = ['سبحان الله', 'الحمد لله', 'الله اكبر'];

  @override
  Widget build(BuildContext context) {
    var myThemeProvider = Provider.of<SettingsProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Image.asset(
                getImagePathByName(
                    imageName: myThemeProvider.themeMode == ThemeMode.light
                        ? 'head_of_seb7a.png'
                        : 'head_of_seb7a_dark.png'),
              ),
              GestureDetector(
                  onTap: () {
                    onPressOnSeb7a();
                  },
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.095),
                    child: Transform.rotate(
                        angle: angle,
                        child: Image.asset(getImagePathByName(
                            imageName:
                                myThemeProvider.themeMode == ThemeMode.light
                                    ? 'body_of_seb7a.png'
                                    : 'body_of_seb7a_dark.png'))),
                  )),
            ],
          ),
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                AppLocalizations.of(context)!.num_of_tasbeh,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: 20,
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  child: Text(
                    count.toString(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  color: Theme.of(context).colorScheme.primary,
                ),
                child: Text(
                  tasbehWords[index],
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void onPressOnSeb7a() {
    angle += 0.12;
    setState(() {
      count++;
      if (count % 34 == 0) {
        count = 1;
        index = (index + 1) % tasbehWords.length;
      }
    });
  }
}
