import 'package:audio_player/kvalues.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:intl/intl.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final assetsAudioPlayer = AssetsAudioPlayer();

  bool isplaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  @override
  void initState() {
    super.initState();

    audio();
  }

  void audio() {
    setState(() {
      assetsAudioPlayer.open(
          Audio(
              "assets/songsmp3/Chayapattu-Project-Malabaricus-Sithara-Krishnakumar.mp3"),
          autoStart: false,
          showNotification: true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text("Now Playing"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
                IconButton(onPressed: () {}, icon: Icon(Icons.add))
              ],
            ),
            Image.asset("assets/songsSS/chayapattu.jpeg"),
            Text(
              "Chayapatt",
              style: kdash,
            ),
            Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (double value) {}),
            SizedBox(
              width: 320,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${position.inSeconds}"),
                  Text("${duration.inSeconds - position.inSeconds}")
                ],
              ),
            ),
            CircleAvatar(
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (isplaying) {
                        assetsAudioPlayer.pause();
                        isplaying = false;
                      } else {
                        assetsAudioPlayer.play();
                        isplaying = true;
                      }
                    });

                    // just attach the one song from the package need to update

                    // if (isplaying) {
                    //   await player.pause();
                    // } else {
                    // final source = await player.setSource(AssetSource(
                    //     'assets/songsmp3/Chayapattu-Project-Malabaricus-Sithara-Krishnakumar.mp3'));
                  },
                  icon: isplaying
                      ? Icon(Icons.pause)
                      : Icon(
                          Icons.play_arrow,
                        )),
            )
          ],
        ));
  }
}
