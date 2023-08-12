import 'package:audio_player/database/sondDb.dart';
import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:flutter/material.dart';

class FavoriteButtonwidget extends StatefulWidget {
  const FavoriteButtonwidget({super.key});

  @override
  State<FavoriteButtonwidget> createState() => _FavoriteButtonwidgetState();
}

class _FavoriteButtonwidgetState extends State<FavoriteButtonwidget> {
  @override
  Widget build(BuildContext context) {
    Songdb().refreshui();
    return ValueListenableBuilder(
        valueListenable: Songdb().songvalueNotifier,
        builder: (context, newvalue, _) {
          return ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      page(context, index);
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
                        onPressed: () {
                          newvalue
                                  .where((element) =>
                                      element.authorname ==
                                      dataModel[index].authorname)
                                  .isEmpty
                              ? Songdb().addsongdata(DataModel(
                                  authorname: dataModel[index].authorname,
                                  songname: dataModel[index].songname,
                                  songpic: dataModel[index].songpic,
                                  url: dataModel[index].url))
                              : Songdb()
                                  .deletesongdata(dataModel[index].authorname);
                          setState(() {});
                        },
                        icon: Icon(
                          newvalue
                                  .where((element) =>
                                      element.songname ==
                                      dataModel[index].songname)
                                  .isEmpty
                              ? Icons.favorite_border
                              : Icons.favorite,
                          color: newvalue
                                  .where((element) =>
                                      element.songname ==
                                      dataModel[index].songname)
                                  .isEmpty
                              ? Colors.white
                              : Colors.red,
                        ),
                      ),
                    ));
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
              itemCount: dataModel.length);
        });
  }

  void page(context, int index) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return MusicPage(
        dataModel: dataModel,
        indexofsong: index,
      );
    }));
  }
}
