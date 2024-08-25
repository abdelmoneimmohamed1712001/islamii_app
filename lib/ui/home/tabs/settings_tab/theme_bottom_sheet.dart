import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  const ThemeBottomSheet({super.key});

  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var myThemeProdider = Provider.of<SettingsProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                myThemeProdider.changeThemeMode(ThemeMode.light);
              },
              child: myThemeProdider.themeMode == ThemeMode.light
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.light)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.light),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                myThemeProdider.changeThemeMode(ThemeMode.dark);
              },
              child: myThemeProdider.themeMode == ThemeMode.dark
                  ? buildSelectedThemeItem(AppLocalizations.of(context)!.dark)
                  : buildUnSelectedThemeItem(
                      AppLocalizations.of(context)!.dark),
            )
          ],
        ),
      ),
    );
  }

  buildSelectedThemeItem(String selectedTheme) {
    return Row(
      children: [
        Text(selectedTheme, style: Theme.of(context).textTheme.titleSmall),
        Spacer(),
        Icon(
          Icons.check,
          color: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }

  buildUnSelectedThemeItem(String unSelectedTheme) {
    return Container(
      width: double.infinity,
      child: Text(
        unSelectedTheme,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
