import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:provider/provider.dart';

class LanguageBottomSheet extends StatefulWidget {
  @override
  State<LanguageBottomSheet> createState() => _LanguageBottomSheetState();
}

class _LanguageBottomSheetState extends State<LanguageBottomSheet> {
  @override
  Widget build(BuildContext context) {
    var myLangProvider = Provider.of<SettingsProvider>(context);
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: () {
                myLangProvider.changeLanguage('en');
              },
              child: myLangProvider.locale == Locale('en')
                  ? buildSelectedLanguageItem(
                      AppLocalizations.of(context)!.english)
                  : buildUnSelectedLanguageItem(
                      AppLocalizations.of(context)!.english),
            ),
            SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                myLangProvider.changeLanguage('ar');
              },
              child: myLangProvider.locale == Locale('ar')
                  ? buildSelectedLanguageItem(
                      AppLocalizations.of(context)!.arabic)
                  : buildUnSelectedLanguageItem(
                      AppLocalizations.of(context)!.arabic),
            )
          ],
        ),
      ),
    );
  }

  buildSelectedLanguageItem(String selectedLanguage) {
    return Row(
      children: [
        Text(selectedLanguage, style: Theme.of(context).textTheme.titleSmall),
        Spacer(),
        Icon(Icons.check, color: Theme.of(context).colorScheme.primary),
      ],
    );
  }

  buildUnSelectedLanguageItem(String unSelectedLanguage) {
    return Container(
      width: double.infinity,
      child: Text(
        unSelectedLanguage,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
