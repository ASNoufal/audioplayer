import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class Control extends StatelessWidget {
  const Control({super.key, required this.audioPlayer});

  final AudioPlayer audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: audioPlayer.seekToPrevious,
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
              final playing = playerState?.playing;
              if (!(playing ?? false)) {
                return IconButton(
                    onPressed: audioPlayer.play,
                    iconSize: 55,
                    color: Colors.white,
                    icon: const Icon(Icons.play_arrow_rounded));
              } else if (processingState != ProcessingState.completed) {
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
            onPressed: audioPlayer.seekToNext,
            icon: const Icon(
              Icons.skip_next,
              size: 35,
              color: Colors.white,
            ))
      ],
    );
  }
}
