import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadith_details/hadith_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/image_utils.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadith_details';

  @override
  Widget build(BuildContext context) {
    var myThemeProvider = Provider.of<SettingsProvider>(context);
    HadithItem hadithItem =
        ModalRoute.of(context)?.settings.arguments as HadithItem;
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
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          body: IntrinsicHeight(
            child: Card(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      hadithItem.title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Divider(
                      indent: 150,
                      endIndent: 150,
                      thickness: 1,
                      color: Theme.of(context).dividerColor,
                    ),
                    HadithWidget(hadithContent: hadithItem.content),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
