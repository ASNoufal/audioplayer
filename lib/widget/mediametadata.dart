import 'package:cached_network_image/cached_network_image.dart';
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
        CachedNetworkImage(
          imageUrl: imageurl,
          height: 300,
          width: 300,
          fit: BoxFit.cover,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 22, color: Colors.white),
          textAlign: TextAlign.center,
        ),
        Text(
          artist,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
