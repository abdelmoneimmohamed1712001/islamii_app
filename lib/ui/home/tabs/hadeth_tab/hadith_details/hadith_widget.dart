import 'package:flutter/cupertino.dart';

class HadithWidget extends StatelessWidget {
  String hadithContent;

  HadithWidget({required this.hadithContent, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50, left: 10, top: 10, right: 10),
      alignment: Alignment.center,
      child: Text(
        hadithContent,
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
      ),
    );
  }
}
