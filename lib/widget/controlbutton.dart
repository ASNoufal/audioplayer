import 'package:audio_player/kvalues.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

bool? playing;

class Control extends StatelessWidget {
  Control({super.key, required this.audioPlayer, required this.index});

  final AudioPlayer audioPlayer;
  int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {
              audioPlayer.setAudioSource(audios[--index]);
            },
            icon: const Icon(
              Icons.skip_previous,
              size: 35,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              final newPosition =
                  audioPlayer.position + const Duration(seconds: -10);
              audioPlayer.seek(newPosition);
            },
            icon: const Icon(
              Icons.skip_previous_rounded,
              size: 35,
              color: Colors.white,
            )),
        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              playing = playerState?.playing;
              if (!(playing ?? false)) {
                print(playing);
                print('----');
                return IconButton(
                    onPressed: audioPlayer.play,
                    iconSize: 55,
                    color: Colors.white,
                    icon: const Icon(Icons.play_arrow_rounded));
              } else if (processingState != ProcessingState.completed) {
                print(playing);

                return IconButton(
                    onPressed: audioPlayer.pause,
                    iconSize: 55,
                    color: Colors.white,
                    icon: const Icon(Icons.pause));
              }
              return const Icon(
                Icons.play_arrow_rounded,
                size: 50,
                color: Colors.white,
              );
            }),
        IconButton(
            onPressed: () {
              final newPosition =
                  audioPlayer.position + const Duration(seconds: 10);
              audioPlayer.seek(newPosition);
            },
            icon: const Icon(
              Icons.skip_next_rounded,
              size: 35,
              color: Colors.white,
            )),
        IconButton(
            onPressed: () {
              audioPlayer.setAudioSource(audios[++index]);
            },
            icon: const Icon(
              Icons.skip_next,
              size: 35,
              color: Colors.white,
            ))
      ],
    );
  }
}
