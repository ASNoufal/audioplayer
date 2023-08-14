import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

const kdash =
    TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold);
const kwhite = TextStyle(color: Colors.white);
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
      songpic: "assets/songsSS/ee39c9d3-177c-4045-b0b2-c1e3df597370_1024.jpeg",
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
      url: "assets/songsmp3/Urukumen Azhalinu Thanalu Lofi_64-(DJPunjab).mp3"),
  DataModel(
      authorname: "pitbull",
      songname: "We are one by pitbull",
      songpic: "assets/songsSS/We_Are_One_cover.png",
      url: "assets/songsmp3/We-Are-One-(Ole-Ola)(PaglaSongs).mp3"),
];
final audios = ConcatenatingAudioSource(children: [
  AudioSource.uri(
    Uri.parse("https://dns4.pendusaab.com/download/128k-dmhol/Chayapattu.mp3"),
    tag: MediaItem(
      id: '0',
      title: "Chayappattu",
      artist: 'Sithara',
      artUri: Uri.parse(
          "https://static.wixstatic.com/media/1c6628_149bb6d8ab924044b6590b158ff7e326~mv2.jpg/v1/crop/x_308,y_7,w_2363,h_1507/fill/w_440,h_281,al_c,q_80,usm_0.66_1.00_0.01,enc_auto/Mojo%20Rising_Dubai_Poster_31.jpg"),
    ),
  ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[1].url),
  //   tag: MediaItem(
  //     id: '2',
  //     title: dataModel[1].songname,
  //     artist: dataModel[1].authorname,
  //     artUri: Uri.parse(dataModel[1].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[2].url),
  //   tag: MediaItem(
  //     id: '3',
  //     title: dataModel[2].songname,
  //     artist: dataModel[2].authorname,
  //     artUri: Uri.parse(dataModel[2].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[3].url),
  //   tag: MediaItem(
  //     id: '4',
  //     title: dataModel[3].songname,
  //     artist: dataModel[3].authorname,
  //     artUri: Uri.parse(dataModel[3].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[4].url),
  //   tag: MediaItem(
  //     id: '5',
  //     title: dataModel[4].songname,
  //     artist: dataModel[4].authorname,
  //     artUri: Uri.parse(dataModel[4].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[5].url),
  //   tag: MediaItem(
  //     id: '6',
  //     title: dataModel[5].songname,
  //     artist: dataModel[5].authorname,
  //     artUri: Uri.parse(dataModel[5].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[6].url),
  //   tag: MediaItem(
  //     id: '7',
  //     title: dataModel[6].songname,
  //     artist: dataModel[6].authorname,
  //     artUri: Uri.parse(dataModel[6].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[7].url),
  //   tag: MediaItem(
  //     id: '8',
  //     title: dataModel[7].songname,
  //     artist: dataModel[7].authorname,
  //     artUri: Uri.parse(dataModel[7].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[8].url),
  //   tag: MediaItem(
  //     id: '9',
  //     title: dataModel[8].songname,
  //     artist: dataModel[8].authorname,
  //     artUri: Uri.parse(dataModel[8].songpic),
  //   ),
  // ),
  // AudioSource.uri(
  //   Uri.parse(dataModel[9].url),
  //   tag: MediaItem(
  //     id: '10',
  //     title: dataModel[9].songname,
  //     artist: dataModel[9].authorname,
  //     artUri: Uri.parse(dataModel[9].songpic),
  //   ),
  // ),
]);
