import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:islamii/core/services/api_manager/api_manager.dart';
import 'package:islamii/utils/image_utils.dart';

class RadioTab extends StatefulWidget {
  RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  final player = AudioPlayer();

  bool isPlay = false;
  int index = 0;

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getRadio(),
      builder: (context, snapshot) {
        var radios = snapshot.data?.radios ?? [];
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                  getImagePathByName(imageName: 'radio_background.png')),
              SizedBox(
                height: 50,
              ),
              snapshot.connectionState == ConnectionState.waiting
                  ? CircularProgressIndicator(
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : Text(
                      radios[index].name ?? '',
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: () async {
                      if (index > 0) {
                        await player.stop();
                        setState(() {
                          index--;
                        });

                        if (radios[index].url?.isNotEmpty ?? false) {
                          try {
                            await player
                                .play(UrlSource(radios[index].url ?? ''));

                            isPlay = true;
                          } catch (e) {
                            print("Error playing audio: $e");
                          }
                        } else {
                          print("Invalid or empty URL");
                        }
                      }
                    },
                    icon: Icon(
                      Icons.skip_previous,
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        if (isPlay) {
                          player.stop();
                          isPlay = false;
                        } else {
                          player.play(UrlSource(radios[index].url ?? ''));
                          isPlay = true;
                        }
                        setState(() {});
                      },
                      icon: Icon(isPlay ? Icons.stop : Icons.play_arrow_rounded,
                          size: 30,
                          color: Theme.of(context).colorScheme.primary)),
                  IconButton(
                    onPressed: () async {
                      if (index < radios.length - 1) {
                        await player.stop();
                        setState(() {
                          index++;
                        });

                        if (radios[index].url?.isNotEmpty ?? false) {
                          try {
                            await player
                                .play(UrlSource(radios[index].url ?? ''));

                            isPlay = true;
                          } catch (e) {
                            print("Error playing audio: $e");
                          }
                        } else {
                          print("Invalid or empty URL");
                        }
                      }
                    },
                    icon: Icon(
                      Icons.skip_next,
                      size: 30,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
