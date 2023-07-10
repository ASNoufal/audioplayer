import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'package:intl/intl.dart';

class MusicPage extends StatefulWidget {
  const MusicPage(
      {super.key, required this.dataModel, required this.indexofsong});

  final List<DataModel> dataModel;
  final int indexofsong;

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
      // here we need to connect the slider and the music by adding some codes in audio assets package

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
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Now Playing"),
        ),
        body: Column(children: [
          SizedBox(
            height: 100,
          ),
          Container(
            width: 250,
            height: 250,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(
                        widget.dataModel[widget.indexofsong].songpic))),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 270,
            child: ListTile(
              title: Text(
                widget.dataModel[widget.indexofsong].songname,
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                widget.dataModel[widget.indexofsong].authorname,
                style: TextStyle(color: Colors.white38),
              ),
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [

          //     Text(
          //       widget.dataModel[widget.indexofsong].songname,
          //       style: ,
          //     ),
          //   ],

          SizedBox(
            width: 400,
            child: Slider(
                activeColor: Colors.white,
                inactiveColor: Colors.white54,
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    position = value as Duration;
                  });
                }),
          ),
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
          SizedBox(
            width: 360,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.first_page,
                      color: Colors.white,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.replay_10,
                      color: Colors.white,
                      size: 40,
                    )),
                CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 27,
                    child: Center(
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
                        },
                        icon: isplaying
                            ? Icon(
                                Icons.pause,
                                size: 35,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.play_arrow,
                                size: 35,
                                color: Colors.black,
                              ),
                      ),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.forward_10,
                      color: Colors.white,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.last_page,
                      color: Colors.white,
                      size: 40,
                    ))
              ],
            ),
          )
        ]));
  }
}
