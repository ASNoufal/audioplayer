import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

final audioPlayerProvider = Provider<AudioPlayer>((ref) {
  return AudioPlayer();
});

final audioPlayerControllerProvider =
    StateNotifierProvider<AudioPlayerController, AudioPlayer>((ref) {
  final audioPlayer = ref.watch(audioPlayerProvider);
  return AudioPlayerController(audioPlayer);
});

class AudioPlayerController extends StateNotifier<AudioPlayer> {
  AudioPlayerController(AudioPlayer value) : super(value);

  void playAudio(String audioUrl) async {
    state.setUrl(audioUrl);
    state.play();
  }

  void stopAudio() {
    state.stop();
  }

  @override
  void dispose() {
    state.dispose();
    super.dispose();
  }
}
