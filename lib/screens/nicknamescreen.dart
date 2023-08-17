import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Nicknamescreen extends StatelessWidget {
  const Nicknamescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/songsSS/images.png"),
                const Text(
                  "So nice to meet you! What do your friends call you?",
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(
                  height: 300,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade600,
                        hintText: "Your nickname...,",
                        border: const OutlineInputBorder(
                            gapPadding: 10,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            borderSide: BorderSide.none)),
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                Container(
                  width: 300,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: Text("Submit",
                          style: GoogleFonts.lobster(
                              color: Colors.white, fontSize: 20))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
