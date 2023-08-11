import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("Search"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(21.0),
            child: TextFormField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black,
                  ),
                  hintText: ("What do yo want to lisen to?"),
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              return Container();
            }),
          )
        ],
      ),
    );
  }
}
