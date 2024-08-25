import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamii/utils/image_utils.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(getImagePathByName(imageName: 'radio_background.png')),
          SizedBox(
            height: 50,
          ),
          Text(
            AppLocalizations.of(context)!.quran_radio,
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous,
                      size: 30, color: Theme.of(context).colorScheme.primary)),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.play_arrow_rounded,
                      size: 30, color: Theme.of(context).colorScheme.primary)),
              SizedBox(
                width: 30,
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    size: 30,
                    color: Theme.of(context).colorScheme.primary,
                  )),
            ],
          )
        ],
      ),
    );
  }
}
