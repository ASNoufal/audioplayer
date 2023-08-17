import 'package:audio_player/database/sondDb.dart';
import 'package:audio_player/kvalues.dart';
import 'package:audio_player/screens/favoritepage.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:audio_player/widget/favoriteButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Songdb().refreshui();
    return SafeArea(
      child: ListView(
        children: [
          Row(
            children: [
              Padding(padding: const EdgeInsets.all(15.0), child: welcome()),
              const Spacer(),
              IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) {
                      return const FavoriteScreen();
                    }));
                  },
                  icon: const Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.blur_on,
                    color: Colors.white,
                  ))
            ],
          ),
          ListTile(
            leading: const CircleAvatar(
              backgroundImage: AssetImage(
                  "assets/songsSS/pngtree-cute-red-blue-musical-notes-music-logo-png-image_3223600.jpeg"),
              radius: 25,
            ),
            title: const Text(
              "NAUFAL AS",
              style: TextStyle(
                  color: Colors.white38, fontSize: 10, letterSpacing: 1),
            ),
            subtitle: const Text(
              "Listen again",
              style: kdash,
            ),
            trailing: TextButton(
              onPressed: () {},
              child: const Text(
                "more",
                style: TextStyle(color: Colors.white38),
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
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
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
