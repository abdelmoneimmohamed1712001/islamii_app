import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:islamii/ui/home/tabs/settings_tab/language_bottom_sheet.dart';
import 'package:islamii/ui/home/tabs/settings_tab/theme_bottom_sheet.dart';
import 'package:provider/provider.dart';

class SettingsTab extends StatefulWidget {
  const SettingsTab({super.key});

  @override
  State<SettingsTab> createState() => _SettingsTabState();
}

class _SettingsTabState extends State<SettingsTab> {
  @override
  Widget build(BuildContext context) {
    var myThemeProvider = Provider.of<SettingsProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showThemeBottomSheet();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).dividerColor,
                  )),
              child: myThemeProvider.themeMode == ThemeMode.light
                  ? Text(AppLocalizations.of(context)!.light,
                      style: Theme.of(context).textTheme.titleSmall)
                  : Text(AppLocalizations.of(context)!.dark,
                      style: Theme.of(context).textTheme.titleSmall),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(AppLocalizations.of(context)!.language,
              style: Theme.of(context).textTheme.labelSmall),
          SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              showLanguageBottomSheet();
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    width: 1,
                    color: Theme.of(context).dividerColor,
                  )),
              child: myThemeProvider.locale == Locale('en')
                  ? Text(AppLocalizations.of(context)!.english,
                      style: Theme.of(context).textTheme.titleSmall)
                  : Text(AppLocalizations.of(context)!.arabic,
                      style: Theme.of(context).textTheme.titleSmall),
            ),
          ),
        ],
      ),
    );
  }

  void showThemeBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => ThemeBottomSheet());
  }

  void showLanguageBottomSheet() {
    showModalBottomSheet(
        context: context, builder: (context) => LanguageBottomSheet());
  }
}
