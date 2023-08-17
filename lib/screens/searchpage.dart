import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:flutter/material.dart';

class SearchPageScreen extends StatefulWidget {
  const SearchPageScreen({super.key});

  @override
  State<SearchPageScreen> createState() => _SearchPageScreenState();
}

class _SearchPageScreenState extends State<SearchPageScreen> {
  List<DataModel> data = dataModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: TextFormField(
                textCapitalization: TextCapitalization.words,
                cursorColor: Colors.white,
                style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                onChanged: (value) {
                  data = dataModel
                      .where((element) => element.songname.contains(value))
                      .toList();

                  setState(() {});
                },
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20))),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: ((context, index) {
                      final datas = int.tryParse(data[index].id!);

                      return InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder) {
                            return MusicPage(
                                dataModel: data,
                                indexofsong:
                                    datas!); // error in this code need to check);
                          }));
                        },
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(
                              data[index].songpic,
                            ),
                          ),
                          title: Text(data[index].songname, style: kwhite),
                          subtitle: Text(
                            data[index].authorname,
                            style: const TextStyle(color: Colors.white38),
                          ),
                        ),
                      );
                    })))
          ],
        ),
      ),
    );
  }
}
