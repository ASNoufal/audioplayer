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
      artUri: Uri.parse("https://dns2.pendusaab.com/thumbmed/25991521.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse(
        "https://ghantalele.com/uploads/files/data-19/9493/Aise%20Kyun_192(Ghantalele.com).mp3"),
    tag: MediaItem(
      id: '1',
      title: dataModel[1].songname,
      artist: dataModel[1].authorname,
      artUri: Uri.parse("https://ghantalele.com/uploads/thumbs/cat/1530_2.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("https://pagalnew.com/download128/34682"),
    tag: MediaItem(
      id: '3',
      title: dataModel[2].songname,
      artist: dataModel[2].authorname,
      artUri: Uri.parse(
          "https://pagalnew.com/coverimages/Let-Me-Down-Slowly-Alec-Benjamin-500-500.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse(
        "https://dns4.pendusaab.com/download/128k-dkovw/Life-Of-Ram-(From-%22Jaanu%22).mp3"),
    tag: MediaItem(
      id: '4',
      title: dataModel[3].songname,
      artist: dataModel[3].authorname,
      artUri: Uri.parse("https://tamilpaatu.com/i/wp/96-2018.webp"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("https://paglasongs.com/files/download/id/13968"),
    tag: MediaItem(
      id: '5',
      title: dataModel[4].songname,
      artist: dataModel[4].authorname,
      artUri:
          Uri.parse("https://paglasongs.com/uploads/thumb/sft28/13968_4.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse(
        "https://files.thenaatsharif.com/downloads/maher-zain/rahmatun-lil-alameen.mp3"),
    tag: MediaItem(
      id: '6',
      title: dataModel[5].songname,
      artist: dataModel[5].authorname,
      artUri: Uri.parse(
          "https://img.wynk.in/unsafe/248x248/filters:no_upscale():strip_exif():format(webp)/http://s3-ap-south-1.amazonaws.com/wynk-music-cms/srch_orchard/music/20220412103411_196626693532/1649775010/srch_orchard_196626693532_QM4TX2236659.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("https://pagalworldi.com/files/download/id/3086"),
    tag: MediaItem(
      id: '7',
      title: dataModel[6].songname,
      artist: dataModel[6].authorname,
      artUri: Uri.parse(
          "https://pagalworldi.com/siteuploads/thumb/sft7/3086_4.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("https://www.pagalworldl.com/files/download/id/19799"),
    tag: MediaItem(
      id: '8',
      title: dataModel[7].songname,
      artist: dataModel[7].authorname,
      artUri: Uri.parse(
          "https://www.pagalworldl.com/uploads/thumb/sft40/19799_4.jpg"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("https://djmaza.live/files/download/id/14077"),
    tag: MediaItem(
      id: '9',
      title: dataModel[8].songname,
      artist: dataModel[8].authorname,
      artUri: Uri.parse(
          "https://djmaza.live/siteuploads/thumb/sft29/14077_resize2x_200x200.webp"),
    ),
  ),
  AudioSource.uri(
    Uri.parse("https://paglasongs.com/files/download/id/10153"),
    tag: MediaItem(
      id: '10',
      title: dataModel[9].songname,
      artist: dataModel[9].authorname,
      artUri:
          Uri.parse("https://paglasongs.com/uploads/thumb/sft21/10153_4.jpg"),
    ),
  ),
]);
