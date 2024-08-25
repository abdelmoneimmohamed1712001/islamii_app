import 'package:flutter/material.dart';
import 'package:islamii/ui/home/tabs/hadeth_tab/hadith_details/hadith_details.dart';

import 'hadeth_tab.dart';

class HadithTitleWidget extends StatelessWidget {
  HadithItem hadithItem;

  HadithTitleWidget({required this.hadithItem});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, HadithDetailsScreen.routeName,
            arguments: hadithItem);
      },
      child: Container(
        child: Text(
          hadithItem.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
    );
  }
}
