import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadith_title_widget.dart';

import '../../../../utils/image_utils.dart';

class HadethTab extends StatefulWidget {
  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadithItem> hadithList = [];

  @override
  Widget build(BuildContext context) {
    if (hadithList.isEmpty) loadHadithFile();

    return Container(
      child: hadithList.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                      getImagePathByName(imageName: 'hadith_header.png')),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  alignment: Alignment.center,
                  child: Text(
                    'الأحاديث',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border.symmetric(
                          horizontal:
                              BorderSide(color: Color(0xFFB7935F), width: 2))),
                ),
                Expanded(
                  flex: 2,
                  child: ListView.separated(
                      itemBuilder: (context, index) => HadithTitleWidget(
                            hadithItem: hadithList[index],
                          ),
                      separatorBuilder: (context, index) => Divider(
                            color: Color(0xffB7935F),
                            thickness: 1,
                            indent: 30,
                            endIndent: 30,
                          ),
                      itemCount: hadithList.length),
                )
              ],
            ),
    );
  }

  void loadHadithFile() async {
    String fileContent =
        await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> allAhadith = fileContent.trim().split('#');
    for (int i = 0; i < allAhadith.length; i++) {
      List<String> hadithLines = allAhadith[i].trim().split('\n');
      String hadithTitle = hadithLines[0];
      hadithLines.removeAt(0);
      String hadithContent = hadithLines.join('\n');

      HadithItem hadithItem =
          HadithItem(title: hadithTitle, content: hadithContent);
      hadithList.add(hadithItem);
    }
    setState(() {});
  }
}

class HadithItem {
  String title;
  String content;

  HadithItem({required this.title, required this.content});
}
