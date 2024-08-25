import 'package:flutter/material.dart';

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
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
