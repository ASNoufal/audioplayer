import 'package:audio_player/homepage.dart';
import 'package:audio_player/searchpage.dart';
import 'package:audio_player/settings.dart';
import 'package:audio_player/yourlibrary.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(theme: ThemeData(), home: BottomNavigatonBar()));
}

class BottomNavigatonBar extends StatefulWidget {
  const BottomNavigatonBar({super.key});

  @override
  State<BottomNavigatonBar> createState() => _BottomNavigatonBarState();
}

class _BottomNavigatonBarState extends State<BottomNavigatonBar> {
  var _selectedIndex = 0;
  List<Widget> items = [
    HomePage(),
    SearchPage(),
    LibraryPage(),
    SettingsPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: Theme(
        data: ThemeData(canvasColor: Colors.transparent),
        child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
            mouseCursor: MaterialStateMouseCursor.textable,
            selectedIconTheme: IconThemeData(color: Colors.white),
            unselectedItemColor: Colors.white38,
            selectedItemColor: Colors.white,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home_filled,
                    size: 35,
                  ),
                  label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 35,
                  ),
                  label: "Search"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.my_library_music,
                    size: 35,
                  ),
                  label: "Your Library"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings_outlined,
                    size: 35,
                  ),
                  label: "Settings")
            ]),
      ),
      // appBar: AppBar(
      //   title: Text(
      //     "Good morning",
      //     style: TextStyle(color: Colors.white),
      //   ),
      // need to Add DateTime and put it in if else case
      //),
      body: items[_selectedIndex],
    );
  }
}
