import 'dart:io';

import 'package:audio_player/database/sondDb.dart';
import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/profilepicture.dart';
import 'package:audio_player/model/username.dart';
import 'package:audio_player/screens/favoritepage.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:audio_player/widget/favoriteButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:just_audio/just_audio.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool ismorebuttonclicked = false;
  late AudioPlayer audioplayer;

  @override
  Widget build(BuildContext context) {
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
                setState(() {
                  if (ismorebuttonclicked == false) {
                    ismorebuttonclicked = true;
                  } else {
                    ismorebuttonclicked = false;
                  }
                });
              },
              child: Text(
                ismorebuttonclicked == false ? "more" : "Less",
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
                    crossAxisCount: ismorebuttonclicked == false ? 1 : 2),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
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
      return Text(
        "Good morning",
        style: GoogleFonts.lobster(
            color: Colors.white, textStyle: const TextStyle(fontSize: 30)),
      );
    } else if (time < 16) {
      return Text(
        "Good Afternoon",
        style: GoogleFonts.lobster(
            color: Colors.white, textStyle: const TextStyle(fontSize: 30)),
      );
    } else {
      return Text(
        "Good Evening",
        style: GoogleFonts.lobster(
            color: Colors.white, textStyle: const TextStyle(fontSize: 30)),
      );
    }
  }
}
