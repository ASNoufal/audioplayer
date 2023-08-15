import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/screens/homepage.dart';
import 'package:audio_player/screens/searchpage.dart';
import 'package:audio_player/settings.dart';
import 'package:audio_player/yourlibrary.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio_background/just_audio_background.dart';

Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true,
  );
  await Hive.initFlutter();

  if (!Hive.isAdapterRegistered(DataModelAdapter().typeId)) {
    Hive.registerAdapter(DataModelAdapter());
  }
  runApp(MaterialApp(theme: ThemeData(), home: const BottomNavigatonBar()));
}

class BottomNavigatonBar extends StatelessWidget {
  const BottomNavigatonBar({super.key});
  static ValueNotifier<int> valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = const [
      HomePage(),
      SearchPageScreen(),
      LibraryPage(),
      SettingsPage()
    ];
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, newvalue, _) {
          return Scaffold(
            backgroundColor: Colors.black,
            bottomNavigationBar: const BottomNavigatorBaritem(),
            body: items[newvalue],
          );
        });
  }
}

class BottomNavigatorBaritem extends StatelessWidget {
  const BottomNavigatorBaritem({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: BottomNavigatonBar.valueNotifier,
        builder: (context, index, _) {
          return Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (value) {
                BottomNavigatonBar.valueNotifier.value = value;
              },
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
              ],
              // mouseCursor: MaterialStateMouseCursor.textable,
              // selectedIconTheme: const IconThemeData(color: Colors.white),
              // unselectedItemColor: Colors.white38,
              // selectedItemColor: Colors.white,
            ),
          );
        });
  }
}
