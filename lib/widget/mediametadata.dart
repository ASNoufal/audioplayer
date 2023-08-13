import 'package:flutter/material.dart';

class MediaMetaData extends StatelessWidget {
  const MediaMetaData(
      {super.key,
      required this.imageurl,
      required this.title,
      required this.artist});

  final String imageurl;
  final String title;
  final String artist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, offset: Offset(2, 4), blurRadius: 4)
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imageurl,
                fit: BoxFit.cover,
                height: 300,
                width: 300,
              )),
        ),
        Text(
          title,
          style: const TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          artist,
          style: TextStyle(color: Colors.grey, fontSize: 20),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
