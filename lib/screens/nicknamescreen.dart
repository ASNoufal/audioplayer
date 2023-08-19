import 'package:audio_player/main.dart';
import 'package:audio_player/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Nicknamescreen extends StatefulWidget {
  const Nicknamescreen({super.key});

  @override
  State<Nicknamescreen> createState() => _NicknamescreenState();
}

class _NicknamescreenState extends State<Nicknamescreen> {
  Future<File> getImageFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');

    final file = File('${(await getTemporaryDirectory()).path}/$path');
    await file.create(recursive: true);
    await file.writeAsBytes(byteData.buffer
        .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    return file;
  }

  File? currentimage;
  void opencamera() async {
    final imagepicker = ImagePicker();
    final pickedimage = await imagepicker.pickImage(source: ImageSource.camera);
    if (pickedimage == null) {
      return;
    }
    setState(() {
      currentimage = File(pickedimage.path);
      print(currentimage);
    });
  }

  function() async {
    return FileImage(await getImageFileFromAssets("songsSS/no image.png"));
  }

  TextEditingController nicknamecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Image.asset("assets/songsSS/images.png"),
                Text(
                  "So nice to meet you! What do your friends call you?",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.labrada(color: Colors.white, fontSize: 24),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: currentimage != null
                        ? FileImage(currentimage!)
                        : function(),
                    child: Stack(children: [
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 41, 122, 44),
                          child: IconButton(
                              onPressed: opencamera,
                              icon: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                              )),
                        ),
                      )
                    ]),
                  ),
                ),
                const SizedBox(
                  height: 150,
                ),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: nicknamecontroller,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.grey.shade600,
                            hintText: "Your nickname...,",
                            border: const OutlineInputBorder(
                                gapPadding: 10,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                borderSide: BorderSide.none)),
                      ),
                      const SizedBox(
                        height: 200,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (nicknamecontroller.text.isEmpty) {
                            return;
                          }
                          Navigator.push(context,
                              MaterialPageRoute(builder: (builder) {
                            return BottomNavigatonBars(
                              nickname: nicknamecontroller.text,
                            );
                          }));
                        },
                        child: Container(
                          width: 300,
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(30)),
                          child: Center(
                              child: Text("Submit",
                                  style: GoogleFonts.lobster(
                                      color: Colors.white, fontSize: 20))),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
