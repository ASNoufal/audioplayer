import 'package:audio_player/main.dart';
import 'package:audio_player/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nicknamescreen extends StatefulWidget {
  const Nicknamescreen({super.key});

  @override
  State<Nicknamescreen> createState() => _NicknamescreenState();
}

class _NicknamescreenState extends State<Nicknamescreen> {
  final formkey = GlobalKey<FormState>();
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
                const SizedBox(
                  height: 300,
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
