import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/model/datamodel.dart';
import 'package:flutter/material.dart';

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

// List<Audio> audios = <Audio>[
//   Audio(dataModel[0].url,
//       metas: Metas(
//         id: '1',
//         title: dataModel[0].songname,
//         artist: dataModel[0].authorname,
//         image: MetasImage.asset(dataModel[0].songpic),
//       )),
//   Audio(dataModel[1].url,
//       metas: Metas(
//           id: '2',
//           title: dataModel[1].songname,
//           artist: dataModel[1].authorname,
//           image: MetasImage.asset(dataModel[1].songpic))),
//   Audio(dataModel[2].url,
//       metas: Metas(
//         id: '3',
//         title: dataModel[2].songname,
//         artist: dataModel[2].authorname,
//         image: MetasImage.asset(dataModel[2].songpic),
//       )),
//   Audio(dataModel[3].url,
//       metas: Metas(
//         id: '4',
//         title: dataModel[3].songname,
//         artist: dataModel[3].authorname,
//         image: MetasImage.asset(dataModel[3].songpic),
//       )),
//   Audio(dataModel[4].url,
//       metas: Metas(
//         id: '5',
//         title: dataModel[4].songname,
//         artist: dataModel[4].authorname,
//         image: MetasImage.asset(dataModel[4].songpic),
//       )),
//   Audio(dataModel[5].url,
//       metas: Metas(
//         id: '6',
//         title: dataModel[5].songname,
//         artist: dataModel[5].authorname,
//         image: MetasImage.asset(dataModel[5].songpic),
//       )),
//   Audio(dataModel[6].url,
//       metas: Metas(
//         id: '7',
//         title: dataModel[6].songname,
//         artist: dataModel[6].authorname,
//         image: MetasImage.asset(dataModel[6].songpic),
//       )),
//   Audio(dataModel[7].url,
//       metas: Metas(
//         id: '8',
//         title: dataModel[7].songname,
//         artist: dataModel[7].authorname,
//         image: MetasImage.asset(dataModel[7].songpic),
//       )),
//   Audio(dataModel[8].url,
//       metas: Metas(
//         id: '9',
//         title: dataModel[8].songname,
//         artist: dataModel[8].authorname,
//         image: MetasImage.asset(dataModel[8].songpic),
//       )),
//   Audio(dataModel[9].url,
//       metas: Metas(
//         id: '10',
//         title: dataModel[9].songname,
//         artist: dataModel[9].authorname,
//         image: MetasImage.asset(dataModel[9].songpic),
//       )),
// ];
