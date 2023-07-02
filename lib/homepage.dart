import 'package:audio_player/kvalues.dart';
import 'package:audio_player/musicpage.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _selectedIndex;

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
            height: 350,
            child: GridView.count(
              padding: EdgeInsets.all(20),
              crossAxisCount: 2,
              mainAxisSpacing: 4,
              scrollDirection: Axis.horizontal,
              children: [
                InkWell(
                  child: Image(
                    image: AssetImage(
                      "assets/songsSS/chayapattu.jpeg",
                    ),
                  ),
                ),
                InkWell(
                  child: Image.asset(
                    "assets/songsSS/ee39c9d3-177c-4045-b0b2-c1e3df597370_1024.jpeg",
                  ),
                ),
                InkWell(
                    child: Image.asset(
                  "assets/songsSS/letme.jpeg",
                )),
                InkWell(child: Image.asset("assets/songsSS/mocking bird.jpeg")),
                InkWell(child: Image.asset("assets/songsSS/rahmatun.jpeg")),
                InkWell(
                  child: Image.asset(
                      "assets/songsSS/Sulaikha-Manzil-Malayalam-2023-20230509171010-500x500.jpeg"),
                ),
                InkWell(
                    child:
                        Image.asset("assets/songsSS/urukumen azhalinu.jpeg")),
                InkWell(
                    child: Image.asset("assets/songsSS/We_Are_One_cover.png")),
                InkWell(child: Image.asset("assets/songsSS/life of ram.jpeg")),
                InkWell(child: Image.asset("assets/songsSS/rapgod.jpeg")),
              ],
            ),
          ),

          // add the item recently played

          ListTile(
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
                        style: TextStyle(color: Colors.white38),
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
