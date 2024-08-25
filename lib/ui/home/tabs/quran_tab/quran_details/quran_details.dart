import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islamii/providers/settings_provider/settings_provider.dart';
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

    // تحميل الآيات إذا كانت القائمة فارغة فقط
    if (verses.isEmpty) {
      loadFile(arguments.index);
    }

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
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            child: RichText(
                              text: TextSpan(
                                children: buildVerseSpans(context),
                              ),
                              textDirection: TextDirection.rtl,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )),
    );
  }

  List<InlineSpan> buildVerseSpans(BuildContext context) {
    List<InlineSpan> spans = [];

    for (int i = 0; i < verses.length; i++) {
      spans.add(TextSpan(
        text: verses[i].trim(),
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
            fontSize: 25, fontFamily: GoogleFonts.amiriQuran().fontFamily),
      ));
      spans.add(TextSpan(
        text: ' ${i + 1} ',
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontFamily: 'Aya',
              fontSize: 27,
              color: Colors.grey,
            ),
      ));
    }

    return spans;
  }

  void loadFile(int index) async {
    if (verses.isEmpty) {
      String fileContent =
          await rootBundle.loadString('assets/files/${index + 1}.txt');
      List<String> suraLines = fileContent.trim().split('\n');

      verses = suraLines.where((line) => line.trim().isNotEmpty).toList();

      setState(() {});
    }
  }
}
