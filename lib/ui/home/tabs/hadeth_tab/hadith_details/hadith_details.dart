import 'package:flutter/material.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadeth_tab.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadith_details/hadith_widget.dart';

import '../../../../../utils/image_utils.dart';

class HadithDetailsScreen extends StatelessWidget {
  static const String routeName = '/hadith_details';

  @override
  Widget build(BuildContext context) {
    HadithItem hadithItem =
        ModalRoute.of(context)?.settings.arguments as HadithItem;
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.fill,
          image:
              AssetImage(getImagePathByName(imageName: 'main_background.png')),
        )),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text("إسلامي"),
          ),
          body: IntrinsicHeight(
            child: Card(
              color: Colors.white,
              elevation: 8,
              margin: EdgeInsets.symmetric(vertical: 18, horizontal: 15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      hadithItem.title,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 25,
                          color: Color(0xffB7935F)),
                    ),
                    Divider(
                      indent: 150,
                      endIndent: 150,
                      thickness: 1,
                      color: Color(0xffB7935F),
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
