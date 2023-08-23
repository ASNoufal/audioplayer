import 'package:audio_player/kvalues.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/screens/musicpage.dart';
import 'package:flutter/material.dart';

class InsideMusicscreen extends StatelessWidget {
  const InsideMusicscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100)),
      child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (builder) {
              return MusicPage(dataModel: dataModel, indexofsong: 0);
            }));
          },
          leading: null),
    );
  }
}
