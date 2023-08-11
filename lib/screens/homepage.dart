import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player/database/sondDb.dart';
import 'package:audio_player/kvalues.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final assetaudioplayer = AssetsAudioPlayer();

  List songplayinquick = [];

  List _selectedIndex = [];
  bool isplaying = false;
  bool favarite = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        children: [
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  "Good morning",
                  //need to add dateTime
                  style: kdash,
                ),
              ),
              const Spacer(),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline_outlined,
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

          SizedBox(
            height: 350,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MusicPage(
                          dataModel: dataModel,
                          indexofsong: index,
                        );
                      }));
                    },
                    //function of song
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(dataModel[index].songpic))),
                        width: 60,
                        height: 80,
                      ),
                      title: Text(
                        dataModel[index].songname,
                        style: kwhite,
                      ),
                      subtitle: Text(
                        dataModel[index].authorname,
                        style: const TextStyle(color: Colors.white38),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite,
                            color: // need to checkkkkkk to add to favarote need updatee not fuctionalise
                                _selectedIndex.contains(index)
                                    ? Colors.red
                                    : Colors.white),
                        onPressed: () => setState(() {
                          if (_selectedIndex.contains(index)) {
                            _selectedIndex.remove(index);
                          } else {
                            _selectedIndex.add(index);
                            final song = Songdb().addsongdata(dataModel[index]);
                            print(song);
                          }

                          // print(_selectedIndex);
                        }),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: dataModel.length),
          )
        ],
      ),
    );
  }
}
