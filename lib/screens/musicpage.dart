import 'dart:ffi';

import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

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
        Playlist(audios: [
          Audio(widget.dataModel[0].url,
              metas: Metas(
                id: '1',
                title: widget.dataModel[0].songname,
                artist: widget.dataModel[0].authorname,
                image: MetasImage.asset(widget.dataModel[0].songpic),
              )),
          Audio(widget.dataModel[1].url,
              metas: Metas(
                  id: '2',
                  title: widget.dataModel[1].songname,
                  artist: widget.dataModel[1].authorname,
                  image: MetasImage.asset(widget.dataModel[1].songpic))),
          Audio(widget.dataModel[2].url,
              metas: Metas(
                id: '3',
                title: widget.dataModel[2].songname,
                artist: widget.dataModel[2].authorname,
                image: MetasImage.asset(widget.dataModel[2].songpic),
              )),
          Audio(widget.dataModel[3].url,
              metas: Metas(
                id: '4',
                title: widget.dataModel[3].songname,
                artist: widget.dataModel[3].authorname,
                image: MetasImage.asset(widget.dataModel[3].songpic),
              )),
          Audio(widget.dataModel[4].url,
              metas: Metas(
                id: '5',
                title: widget.dataModel[4].songname,
                artist: widget.dataModel[4].authorname,
                image: MetasImage.asset(widget.dataModel[4].songpic),
              )),
          Audio(widget.dataModel[5].url,
              metas: Metas(
                id: '6',
                title: widget.dataModel[5].songname,
                artist: widget.dataModel[5].authorname,
                image: MetasImage.asset(widget.dataModel[5].songpic),
              )),
          Audio(widget.dataModel[6].url,
              metas: Metas(
                id: '7',
                title: widget.dataModel[6].songname,
                artist: widget.dataModel[6].authorname,
                image: MetasImage.asset(widget.dataModel[6].songpic),
              )),
          Audio(widget.dataModel[7].url,
              metas: Metas(
                id: '8',
                title: widget.dataModel[7].songname,
                artist: widget.dataModel[7].authorname,
                image: MetasImage.asset(widget.dataModel[7].songpic),
              )),
          Audio(widget.dataModel[8].url,
              metas: Metas(
                id: '9',
                title: widget.dataModel[8].songname,
                artist: widget.dataModel[8].authorname,
                image: MetasImage.asset(widget.dataModel[8].songpic),
              )),
          Audio(widget.dataModel[9].url,
              metas: Metas(
                id: '10',
                title: widget.dataModel[9].songname,
                artist: widget.dataModel[9].authorname,
                image: MetasImage.asset(widget.dataModel[9].songpic),
              )),
        ]),
        autoStart: false,
        showNotification: true,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text("Now Playing"),
        ),
        body: Column(children: [
          const SizedBox(
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 270,
            child: ListTile(
              title: Text(
                widget.dataModel[widget.indexofsong].songname,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
              subtitle: Text(
                widget.dataModel[widget.indexofsong].authorname,
                style: const TextStyle(color: Colors.white38),
              ),
            ),
          ),
          SizedBox(
            width: 400,
            child: StreamBuilder<Duration>(
              stream: assetsAudioPlayer.currentPosition,
              builder: (BuildContext context, snapshot) {
                final durationState = snapshot.data;
                final milliseconds = durationState?.inMilliseconds;
                final songmilliseconds = snapshot.data?.inMilliseconds;

                return Slider(
                    min: 0,
                    max: songmilliseconds!.toDouble(),
                    value: songmilliseconds > milliseconds!
                        ? milliseconds.toDouble()
                        : songmilliseconds.toDouble(),
                    onChanged: ((value) {
                      assetsAudioPlayer.seek(
                          Duration(milliseconds: (value / 1000.0).toInt()));
                    }));
              },
            ),
// need to study the slider
            // Slider(
            //     activeColor: Colors.white,
            //     inactiveColor: Colors.white54,
            //     min: 0.0,
            //     max: duration.inSeconds.toDouble(),
            //     value: position.inSeconds.toDouble(),
            //     onChanged: (double value) {
            //       setState(() {
            //         position = value as Duration;
            //       });
            //     }),
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
                    icon: const Icon(
                      Icons.first_page,
                      color: Colors.white,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {
                      setState(() {
                        assetsAudioPlayer.seekBy(Duration(seconds: 10));
                        print("hello");
                      });
                    },
                    icon: const Icon(
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
                              assetsAudioPlayer
                                  .playlistPlayAtIndex(widget.indexofsong);
                              isplaying = true;
                            }
                          });
                        },
                        icon: isplaying
                            ? const Icon(
                                Icons.pause,
                                size: 35,
                                color: Colors.black,
                              )
                            : const Icon(
                                Icons.play_arrow,
                                size: 35,
                                color: Colors.black,
                              ),
                      ),
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.forward_10,
                      color: Colors.white,
                      size: 40,
                    )),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
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

class PositionData {
  const PositionData(
    this.position,
    this.bufferposition,
    this.duration,
  );
  final Duration position;
  final Duration bufferposition;
  final Duration duration;
}
// ProgressBar(
//                     progress: const Duration(
//                       milliseconds: 1000,
//                     ),
//                     buffered: const Duration(milliseconds: 2000),
//                     total: const Duration(milliseconds: 5000),
//                     onSeek: (duration) {
                    
//                     },
//                   );