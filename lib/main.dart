import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/screens/homepage.dart';
import 'package:audio_player/screens/searchpage.dart';
import 'package:audio_player/settings.dart';
import 'package:audio_player/yourlibrary.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(DataModelAdapter().typeId)) {
    Hive.registerAdapter(DataModelAdapter());
  }
  runApp(MaterialApp(theme: ThemeData(), home: const BottomNavigatonBar()));
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
            showUnselectedLabels: true,
            currentIndex: _selectedIndex,
            onTap: (index) => setState(() {
                  _selectedIndex = index;
                }),
            mouseCursor: MaterialStateMouseCursor.textable,
            selectedIconTheme: const IconThemeData(color: Colors.white),
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
      body: items[_selectedIndex],
    );
  }
}
