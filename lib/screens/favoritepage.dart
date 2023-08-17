import 'package:audio_player/database/sondDb.dart';
import 'package:audio_player/kvalues.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget favorites = Center(
      child: Text(
        "No Favorites",
        style: GoogleFonts.lobster(fontSize: 24, color: Colors.white),
      ),
    );
    Songdb().refreshui();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Your Favorites"),
      ),
      body: Songdb().songvalueNotifier.value.isEmpty
          ? favorites
          : ValueListenableBuilder(
              valueListenable: Songdb().songvalueNotifier,
              builder: (context, newvalue, _) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          radius: 40,
                          backgroundImage: AssetImage(
                            newvalue[index].songpic,
                          ),
                        ),
                        title: Text(newvalue[index].songname, style: kwhite),
                        subtitle: Text(
                          newvalue[index].authorname,
                          style: const TextStyle(color: Colors.white38),
                        ),
                      );
                    },
                    separatorBuilder: ((context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    }),
                    itemCount: newvalue.length);
              }),
    );
  }
}
