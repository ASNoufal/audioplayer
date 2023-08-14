import 'dart:ui';

import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/widget/controlbutton.dart';
import 'package:audio_player/widget/mediametadata.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';

class MusicPage extends StatefulWidget {
  const MusicPage(
      {super.key, required this.dataModel, required this.indexofsong});

  final List<DataModel> dataModel;
  final int indexofsong;

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  late AudioPlayer _audioPlayer;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        _audioPlayer.positionStream,
        _audioPlayer.bufferedPositionStream,
        _audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    init();
    super.initState();
  }

  Future<void> init() async {
    try {
      await _audioPlayer.setLoopMode(LoopMode.all);
    } catch (e) {
      print("error $e");
    }

    try {
      await _audioPlayer.setAudioSource(audios);
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
        ),
        body: Stack(children: [
          Container(
            padding: const EdgeInsets.all(20),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      dataModel[widget.indexofsong].songpic,
                    ),
                    fit: BoxFit.cover)),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  StreamBuilder<SequenceState?>(
                    stream: _audioPlayer.sequenceStateStream,
                    builder: (context, snapshot) {
                      final state = snapshot.data;
                      if (state?.sequence.isEmpty ?? true) {
                        return const SizedBox();
                      }
                      final metadata = state!.currentSource!.tag as MediaItem;
                      return MediaMetaData(
                        imageurl: metadata.artUri.toString(),
                        title: metadata.title,
                        artist: metadata.artist ?? " ",
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  StreamBuilder<PositionData>(
                      stream: _positionDataStream,
                      builder: ((context, snapshot) {
                        final positionData = snapshot.data;
                        return ProgressBar(
                          barHeight: 3,
                          barCapShape: BarCapShape.round,
                          baseBarColor: Colors.grey[600],
                          bufferedBarColor: Colors.grey,
                          thumbColor: Colors.white,
                          progressBarColor: Colors.white,
                          timeLabelTextStyle: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                          progress: positionData?.position ?? Duration.zero,
                          buffered:
                              positionData?.bufferposition ?? Duration.zero,
                          total: positionData?.duration ?? Duration.zero,
                          onSeek: _audioPlayer.seek,
                        );
                      })),
                  const SizedBox(
                    height: 10,
                  ),
                  Control(audioPlayer: _audioPlayer)
                ],
              ),
            ),
          ),
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
//   late AssetsAudioPlayer _assetsAudioPlayer;
//   final List<StreamSubscription> _subscription = [];

//   bool isplaying = true;
//   Duration duration = Duration.zero;
//   Duration position = Duration.zero;
//   bool autostart = true;
//   @override
//   void initState() {
//     _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    
//     _subscription.add(_assetsAudioPlayer.playlistAudioFinished.listen((data) {
//       print("play list audio finished : $data");
//     }));
//     _subscription.add(_assetsAudioPlayer.audioSessionId.listen((sectionid) {
//       print("sectionid : $sectionid");
//     }));
//     openplayer();
//     super.initState();
//   }

//   void openplayer() async {
//     await _assetsAudioPlayer.open(
//       Playlist(audios: audios, startIndex: widget.indexofsong),
//       playInBackground: PlayInBackground.enabled,
//       showNotification: true,
//       autoStart: true
//     );
//   }

//   @override
//   void dispose() {
//     _assetsAudioPlayer.dispose();
//     print("dispose");

//     super.dispose();
//   }

//   Audio find(List<Audio> source, String fromPath) {
//     return source.firstWhere((element) => element.path == fromPath);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.yellow,
//         appBar: AppBar(
//           backgroundColor: Colors.black,
//           title: const Text("Now Playing"),
//         ),
//         body: Column(children: [
//           const SizedBox(
//             height: 100,
//           ),
//           Container(
//             width: 250,
//             height: 250,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 image: DecorationImage(
//                     image: AssetImage(
//                         widget.dataModel[widget.indexofsong].songpic))),
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           SizedBox(
//             width: 270,
//             child: ListTile(
//               title: Text(
//                 widget.dataModel[widget.indexofsong].songname,
//                 style: const TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               subtitle: Text(
//                 widget.dataModel[widget.indexofsong].authorname,
//                 style: const TextStyle(color: Colors.white38),
//               ),
//             ),
//           ),
//           SizedBox(
//             width: 400,
//             child: StreamBuilder<Playing?>(
//                 stream: _assetsAudioPlayer.current,
//                 builder: (BuildContext context, playing) {
//                   if (playing.data != null) {
//                     find(audios, playing.data!.audio.assetAudioPath);
//                     print("  ======    =====");
//                     print(playing.data!.audio.assetAudioPath);
//                   }
//                   return Container();
//                   //   return Slider(
//                   //       min: 0,
//                   //       max: songmilliseconds!.toDouble(),
//                   //       value: songmilliseconds > milliseconds!
//                   //           ? milliseconds.toDouble()
//                   //           : songmilliseconds.toDouble(),
//                   //       onChanged: ((value) {
//                   //         _assetsAudioPlayer.seek(
//                   //             Duration(milliseconds: (value / 1000.0).toInt()));
//                   //       }));
//                   // },
//                 }),
// // need to study the slider
//             // Slider(
//             //     activeColor: Colors.white,
//             //     inactiveColor: Colors.white54,
//             //     min: 0.0,
//             //     max: duration.inSeconds.toDouble(),
//             //     value: position.inSeconds.toDouble(),
//             //     onChanged: (double value) {
//             //       setState(() {
//             //         position = value as Duration;
//             //       });
//             //     }),
//           ),
//           SizedBox(
//             width: 320,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("${position.inSeconds}"),
//                 Text("${duration.inSeconds - position.inSeconds}")
//               ],
//             ),
//           ),
//           SizedBox(
//             width: 360,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.first_page,
//                       color: Colors.white,
//                       size: 40,
//                     )),
//                 IconButton(
//                     onPressed: () {
//                       setState(() {
//                         _assetsAudioPlayer.seekBy(const Duration(seconds: -10));
//                         print("hello");
//                       });
//                     },
//                     icon: const Icon(
//                       Icons.replay_10,
//                       color: Colors.white,
//                       size: 40,
//                     )),
//                 CircleAvatar(
//                     backgroundColor: Colors.white,
//                     radius: 27,
//                     child: Center(
//                       child: IconButton(
//                         onPressed: () {
//                           setState(() {
//                             if (isplaying) {
//                               _assetsAudioPlayer.pause();
//                               isplaying = false;
//                             } else {
//                               _assetsAudioPlayer
//                                   .playlistPlayAtIndex(widget.indexofsong);
//                               isplaying = true;
//                             }
//                           });
//                         },
//                         icon: isplaying
//                             ? const Icon(
//                                 Icons.pause,
//                                 size: 35,
//                                 color: Colors.black,
//                               )
//                             : const Icon(
//                                 Icons.play_arrow,
//                                 size: 35,
//                                 color: Colors.black,
//                               ),
//                       ),
//                     )),
//                 IconButton(
//                     onPressed: () {
//                       _assetsAudioPlayer.seekBy(const Duration(seconds: 10));
//                     },
//                     icon: const Icon(
//                       Icons.forward_10,
//                       color: Colors.white,
//                       size: 40,
//                     )),
//                 IconButton(
//                     onPressed: () {},
//                     icon: const Icon(
//                       Icons.last_page,
//                       color: Colors.red,
//                       size: 40,
//                     ))
//               ],
//             ),
//           )
//         ]));
//   }
// }

// 
// ProgressBar(
//                     progress: const Duration(
//                       milliseconds: 1000,
//                     ),
//                     buffered: const Duration(milliseconds: 2000),
//                     total: const Duration(milliseconds: 5000),
//                     onSeek: (duration) {
                    
//                     },
//                   );