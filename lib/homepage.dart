import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/musicpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final assetaudioplayer = AssetsAudioPlayer();
  @override
  void initState() {
    audios();
    super.initState();
  }

  void audios() {
    setState(() {
      assetaudioplayer.open(
          Audio(
              "assets/songsmp3/Chayapattu-Project-Malabaricus-Sithara-Krishnakumar.mp3"),
          autoStart: false,
          showNotification: true);
    });
  }

  int? _selectedIndex;
  bool isplaying = false;
  @override
  Widget build(BuildContext context) {
    List<DataModel> dataModel = [
      DataModel(
          authorname: 'Sithara',
          songname: "Chayappattu",
          songpic: "assets/songsSS/chayapattu.jpeg"),
      DataModel(
          authorname: "Ghazal ",
          songname: "Aise Kyun(Ghazal Version)",
          songpic:
              "assets/songsSS/ee39c9d3-177c-4045-b0b2-c1e3df597370_1024.jpeg"),
      DataModel(
          authorname: "Nappu",
          songname: "Let Me Down Slowly",
          songpic: "assets/songsSS/letme.jpeg"),
      DataModel(
          authorname: "suku",
          songname: "Life of ram",
          songpic: "assets/songsSS/life of ram.jpeg"),
      DataModel(
          authorname: "Eminem",
          songname: "Mocking bird",
          songpic: "assets/songsSS/mocking bird.jpeg"),
      DataModel(
          authorname: "kadar",
          songname: "Rahmatun Lil Alameen",
          songpic: "assets/songsSS/rahmatun.jpeg"),
      DataModel(
          authorname: "ganu",
          songname: "Rap God",
          songpic: "assets/songsSS/rapgod.jpeg"),
      DataModel(
          authorname: "jabaz",
          songname: "Sulaikha Manzil",
          songpic:
              "assets/songsSS/Sulaikha-Manzil-Malayalam-2023-20230509171010-500x500.jpeg"),
      DataModel(
          authorname: "ajml",
          songname: "Urukumen Azhalinu Thanalu",
          songpic: "assets/songsSS/urukumen azhalinu.jpeg"),
      DataModel(
          authorname: "pitbull",
          songname: "We are one by pitbull",
          songpic: "assets/songsSS/We_Are_One_cover.png"),
    ];

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
            leading: const CircleAvatar(),
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
                scrollDirection: Axis.horizontal,
                itemCount: dataModel.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1),
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(dataModel[index].songpic),
                        ),
                      ),
                      child: Center(
                          child: CircleAvatar(
                        child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (isplaying) {
                                  assetaudioplayer.pause();
                                  isplaying = false;
                                } else {
                                  assetaudioplayer.play();
                                  isplaying = true;
                                }
                              });
                            },
                            icon: isplaying
                                ? const Icon(Icons.pause)
                                : const Icon(Icons.play_arrow)),
                      )),
                    ),
                  );
                }),
            // child: GridView.count(
            //   padding: EdgeInsets.all(20),
            //   crossAxisCount: 2,
            //   mainAxisSpacing: 4,
            //   scrollDirection: Axis.horizontal,
            //   children: [
            //     InkWell(
            //       child: Image(
            //         image: AssetImage(
            //           "assets/songsSS/chayapattu.jpeg",
            //         ),
            //       ),
            //     ),
            //     InkWell(
            //       child: Image.asset(
            //         "assets/songsSS/ee39c9d3-177c-4045-b0b2-c1e3df597370_1024.jpeg",
            //       ),
            //     ),
            //     InkWell(
            //         child: Image.asset(
            //       "assets/songsSS/letme.jpeg",
            //     )),
            //     InkWell(child: Image.asset("assets/songsSS/mocking bird.jpeg")),
            //     InkWell(child: Image.asset("assets/songsSS/rahmatun.jpeg")),
            //     InkWell(
            //       child: Image.asset(
            //           "assets/songsSS/Sulaikha-Manzil-Malayalam-2023-20230509171010-500x500.jpeg"),
            //     ),
            //     InkWell(
            //         child:
            //             Image.asset("assets/songsSS/urukumen azhalinu.jpeg")),
            //     InkWell(
            //         child: Image.asset("assets/songsSS/We_Are_One_cover.png")),
            //     InkWell(child: Image.asset("assets/songsSS/life of ram.jpeg")),
            //     InkWell(child: Image.asset("assets/songsSS/rapgod.jpeg")),
            //   ],
            // ),
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
            height: 300,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MusicPage();
                      }));
                    },
                    //function of song
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Songpicture[index]))),
                        width: 60,
                        height: 80,
                      ),
                      title: Text(
                        Songname[index],
                        style: kwhite,
                      ),
                      subtitle: Text(
                        authorname[index],
                        style: const TextStyle(color: Colors.white38),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.favorite,
                            color: // need to checkkkkkk to add to favarote need updatee not fuctionalise
                                _selectedIndex != null &&
                                        _selectedIndex == index
                                    ? Colors.red
                                    : Colors.white),
                        onPressed: () => setState(() {
                          _selectedIndex = index;
                        }),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox();
                },
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
