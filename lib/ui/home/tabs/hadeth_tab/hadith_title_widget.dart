import 'package:flutter/material.dart';

class HadithTitleWidget extends StatelessWidget {
  String hadithTitle;

  HadithTitleWidget({required this.hadithTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        child: Text(
          hadithTitle,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
