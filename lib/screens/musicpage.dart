import 'dart:ui';

import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/provider/audioprovider.dart';
import 'package:audio_player/screens/homepage.dart';
import 'package:audio_player/widget/controlbutton.dart';
import 'package:audio_player/widget/mediametadata.dart';
import 'package:flutter/material.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:rxdart/rxdart.dart';

bool ismusicplaying = false;

class MusicPage extends StatefulWidget {
  const MusicPage(
      {super.key, required this.dataModel, required this.indexofsong});

  final List<DataModel> dataModel;
  final int indexofsong;

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  // late AudioPlayer _audioPlayer;
  late AudioPlayerController audioPlayerController;

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        AudioService.audioPlayer.positionStream,
        AudioService.audioPlayer.bufferedPositionStream,
        AudioService.audioPlayer.durationStream,
        (position, bufferedPosition, duration) =>
            PositionData(position, bufferedPosition, duration ?? Duration.zero),
      );

  @override
  void initState() {
    print("while going to next music");
    // _audioPlayer = AudioPlayer();

    init();
    super.initState();
  }

  Future<void> init() async {
    try {
      await AudioService.audioPlayer.setLoopMode(LoopMode.all);
    } catch (e) {
      print("error $e");
    }

    try {
      await AudioService.audioPlayer.setAudioSource(audios[widget.indexofsong]);
      setState(() {});
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  // @override
  // void dispose() {
  //   _audioPlayer.dispose();
  //   super.dispose();
  // }

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
                    stream: AudioService.audioPlayer.sequenceStateStream,
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
                          onSeek: AudioService.audioPlayer.seek,
                        );
                      })),
                  const SizedBox(
                    height: 10,
                  ),
                  Control(
                    audioPlayer: AudioService.audioPlayer,
                    index: widget.indexofsong,
                  )
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
