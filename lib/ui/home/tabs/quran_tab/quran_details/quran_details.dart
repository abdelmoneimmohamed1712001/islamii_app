import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
import 'package:islamii/ui/home/tabs/quran_tab/quran_details/verse_widget.dart';
import 'package:provider/provider.dart';

import '../../../../../utils/image_utils.dart';
import '../sura_title_widget.dart';

class QuranDetailsScreen extends StatefulWidget {
  static const String routeName = '/quran_details';

  @override
  State<QuranDetailsScreen> createState() => _QuranDetailsScreenState();
}

class _QuranDetailsScreenState extends State<QuranDetailsScreen> {
  List<String> verses = [];

  @override
  Widget build(BuildContext context) {
    var myThemeMode = Provider.of<SettingsProvider>(context);
    SuraArguments arguments =
        ModalRoute.of(context)?.settings.arguments as SuraArguments;
    if (verses.isEmpty) loadFile(arguments.index);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        fit: BoxFit.fill,
        image: AssetImage(getImagePathByName(
            imageName: myThemeMode.themeMode == ThemeMode.light
                ? 'main_background.png'
                : 'home_dark_background.png')),
      )),
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(AppLocalizations.of(context)!.app_title),
          ),
          body: verses.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Card(
                  child: Column(
                    children: [
                      Text(
                        "سورة ${arguments.suraTitle}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Divider(
                        indent: 150,
                        endIndent: 150,
                        thickness: 1,
                        color: Theme.of(context).dividerColor,
                      ),
                      Expanded(
                        child: ListView.separated(
                          itemBuilder: (context, index) =>
                              VerseWidget(verse: verses[index]),
                          separatorBuilder: (context, index) => Divider(
                              thickness: 1,
                              endIndent: 24,
                              indent: 24,
                              color: Theme.of(context).dividerColor),
                          itemCount: verses.length,
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }

  void loadFile(int index) async {
    String fileContent =
        await rootBundle.loadString('assets/files/${index + 1}.txt');
    List<String> suraLines = fileContent.split('\n');

    verses = suraLines;

    suraLines.forEach(
      (element) {},
    );
    setState(() {});
  }
}
