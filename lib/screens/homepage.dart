import 'dart:io';

import 'package:audio_player/database/sondDb.dart';
import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/profilepicture.dart';
import 'package:audio_player/model/username.dart';
import 'package:audio_player/provider/homepageProvider.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:audio_player/widget/favoriteButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late AudioPlayer audioplayer;
  final provider = StateNotifierProvider<HomePageNotifier, bool>(
      (ref) => HomePageNotifier());
  final getindex = StateProvider((ref) => -1);
  @override
  Widget build(BuildContext context) {
    final currentlyPlayingIndex = ref.watch(getindex);
    final nameprovider = ref.watch(provider);
    Songdb().refreshui();

    Username data = box.get("id");
    ProfilePicture profiles = profilebox.get("profile");

    return SafeArea(
      child: ListView(
        children: [
          Row(children: [
            Padding(padding: const EdgeInsets.all(15.0), child: welcome()),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 25,
                backgroundImage: FileImage(File(profiles.profilepic)),
              ),
            )
          ]),
          ListTile(
            title: Text(
              data.name.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white38, fontSize: 15, letterSpacing: 1),
            ),
            subtitle: const Text(
              "Listen again",
              style: kdash,
            ),
            trailing: TextButton(
              onPressed: () {
                ref.read(provider.notifier).isbuttonclicked();

                // setState(() {
                //   if (ismorebuttonclicked == false) {
                //     ismorebuttonclicked = true;
                //   } else {
                //     ismorebuttonclicked = false;
                //   }
                // });
              },
              child: Text(
                nameprovider == false ? "more" : "Less",
                style: const TextStyle(color: Colors.white38),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 200,
            child: GridView.builder(
                padding: const EdgeInsets.only(left: 20, bottom: 10, top: 10),
                scrollDirection: Axis.horizontal,
                itemCount: dataModel.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: nameprovider == false ? 1 : 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      if (currentlyPlayingIndex != index) {
                        audioplayer.stop();
                      }

                      // Stop the currently playing song (if any)
                      if (currentlyPlayingIndex != -1) {
                        audioplayer.stop();
                      }
                      ref.read(getindex.notifier).state = index;
                      // setState(() {
                      //   currentlyPlayingIndex = index;
                      // });
                      audioplayer.setAudioSource(audios[index]);
                      audioplayer.play();

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MusicPage(
                            dataModel: dataModel, indexofsong: index);
                      }));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(dataModel[index].songpic),
                        ),
                      ),
                      child: const Center(
                        child: CircleAvatar(child: Icon(Icons.play_arrow)),
                      ),
                    ),
                  );
                }),
          ),

          // add the item recently played

          const ListTile(
            title: Text("START RADIO FROM A SONG",
                style: TextStyle(
                    color: Colors.white38, fontSize: 10, letterSpacing: 1)),
            subtitle: Text(
              "Quick picks",
              style: kdash,
            ),
            // we need to addd list view for adding song
          ),

          const SizedBox(height: 350, child: FavoriteButtonwidget())
        ],
      ),
    );
  }

  Widget welcome() {
    final time = DateTime.now().hour;

    if (time < 12) {
      return const Text(
        "Good morning",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else if (time < 16) {
      return const Text(
        "Good Afternoon",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      );
    } else {
      return const Text(
        "Good Evening",
        style: TextStyle(
            color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
      );
    }
  }
}

class AudioService {
  static final AudioPlayer audioPlayer = AudioPlayer();
}
