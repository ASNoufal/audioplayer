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

  List songplayinquick = [];

  List _selectedIndex = [];
  bool isplaying = false;
  bool favarite = false;
  @override
  Widget build(BuildContext context) {
    List<DataModel> dataModel = [
      DataModel(
          authorname: 'Sithara',
          songname: "Chayappattu",
          songpic: "assets/songsSS/chayapattu.jpeg",
          url:
              "assets/songsmp3/Chayapattu-Project-Malabaricus-Sithara-Krishnakumar.mp3"),
      DataModel(
          authorname: "Ghazal ",
          songname: "Aise Kyun(Ghazal Version)",
          songpic:
              "assets/songsSS/ee39c9d3-177c-4045-b0b2-c1e3df597370_1024.jpeg",
          url:
              "assets/songsmp3/Aise Kyun (Ghazal Version)_192(Ghantalele.com).mp3"),
      DataModel(
          authorname: "Nappu",
          songname: "Let Me Down Slowly",
          songpic: "assets/songsSS/letme.jpeg",
          url: "assets/songsmp3/Let Me Down Slowly Alec Benjamin 128 Kbps.mp3"),
      DataModel(
          authorname: "suku",
          songname: "Life of ram",
          songpic: "assets/songsSS/life of ram.jpeg",
          url: "assets/songsmp3/The_Life_Of_Ram-MassTamilan.com.mp3"),
      DataModel(
          authorname: "Eminem",
          songname: "Mocking bird",
          songpic: "assets/songsSS/mocking bird.jpeg",
          url: "assets/songsmp3/Mockingbird(PaglaSongs).mp3"),
      DataModel(
          authorname: "kadar",
          songname: "Rahmatun Lil Alameen",
          songpic: "assets/songsSS/rahmatun.jpeg",
          url: "assets/songsmp3/rahmatun-lil-alameen.mp3"),
      DataModel(
          authorname: "ganu",
          songname: "Rap God",
          songpic: "assets/songsSS/rapgod.jpeg",
          url: "assets/songsmp3/Rap-God---Eminem-320(PagalWorld).mp3"),
      DataModel(
          authorname: "jabaz",
          songname: "Sulaikha Manzil",
          songpic:
              "assets/songsSS/Sulaikha-Manzil-Malayalam-2023-20230509171010-500x500.jpeg",
          url: "assets/songsmp3/Haal-Aake-Maarunne-MassTamilan.dev.mp3"),
      DataModel(
          authorname: "ajml",
          songname: "Urukumen Azhalinu Thanalu",
          songpic: "assets/songsSS/urukumen azhalinu.jpeg",
          url:
              "assets/songsmp3/Urukumen Azhalinu Thanalu Lofi_64-(DJPunjab).mp3"),
      DataModel(
          authorname: "pitbull",
          songname: "We are one by pitbull",
          songpic: "assets/songsSS/We_Are_One_cover.png",
          url: "assets/songsmp3/We-Are-One-(Ole-Ola)(PaglaSongs).mp3"),
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
                      child: Center(
                        child: CircleAvatar(
                          child: IconButton(
                            icon: songplayinquick.contains(index)
                                ? const Icon(Icons.pause)
                                : const Icon(Icons.play_arrow),
                            onPressed: () => setState(() {
                              // if (songplayinquick.contains(index)) {
                              //   // assetaudioplayer.pause();
                              //   songplayinquick.remove(index);
                              //   print(songplayinquick);
                              // } else {
                              //   // assetaudioplayer.play();
                              //   songplayinquick.add(index);

                              // }
                            }),
                          ),
                        ),
                      ),
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
                                _selectedIndex.contains(index)
                                    ? Colors.red
                                    : Colors.white),
                        onPressed: () => setState(() {
                          if (_selectedIndex.contains(index)) {
                            _selectedIndex.remove(index);
                          } else {
                            _selectedIndex.add(index);
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
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
