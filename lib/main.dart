import 'package:audio_player/model/datamodel.dart';
import 'package:audio_player/model/filemodelpath.dart';
import 'package:audio_player/model/profilepicture.dart';
import 'package:audio_player/model/username.dart';
import 'package:audio_player/screens/favoritepage.dart';
import 'package:audio_player/screens/homepage.dart';
import 'package:audio_player/screens/insidemusic.dart';
import 'package:audio_player/screens/nicknamescreen.dart';
import 'package:audio_player/screens/searchpage.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

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
  if (!Hive.isAdapterRegistered(UsernameAdapter().typeId)) {
    Hive.registerAdapter(UsernameAdapter());
  }
  if (!Hive.isAdapterRegistered(ProfilePictureAdapter().typeId)) {
    Hive.registerAdapter(ProfilePictureAdapter());
  }
  if (!Hive.isAdapterRegistered(FileTypeAdapter().typeId)) {
    Hive.registerAdapter(FileTypeAdapter());
  }

  box = await Hive.openBox<Username>('username');
  profilebox = await Hive.openBox<ProfilePicture>('data profile open');

  runApp(MaterialApp(theme: ThemeData(), home: data()));
}

Widget data() {
  if (profilebox.values.isEmpty || box.values.isEmpty) {
    return const Nicknamescreen();
  } else {
    return const BottomNavigatonBars();
  }
}

class BottomNavigatonBars extends StatelessWidget {
  const BottomNavigatonBars({
    super.key,
  });
  static ValueNotifier<int> valueNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      const HomePage(),
      const SearchPageScreen(),
      const FavoriteScreen(),
      const SettingsPage()
    ];
    return ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, newvalue, _) {
          return Scaffold(
            bottomSheet: const InsideMusicscreen(),
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
        valueListenable: BottomNavigatonBars.valueNotifier,
        builder: (context, index, _) {
          return Theme(
            data: ThemeData(canvasColor: Colors.transparent),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
              child: GNav(
                color: Colors.white,
                activeColor: Colors.white,
                tabBackgroundColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                curve: Curves.easeInOutSine,
                tabActiveBorder:
                    Border.all(color: Colors.grey.shade600, width: 2.5),

                gap: 8,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                selectedIndex: index,
                onTabChange: (value) {
                  BottomNavigatonBars.valueNotifier.value = value;
                },
                tabs: const [
                  GButton(
                    icon: Icons.home_outlined,
                    text: "Home",
                    iconColor: Colors.white,
                    textColor: Colors.grey,
                  ),
                  GButton(
                    icon: Icons.search,
                    text: "Search",
                    iconColor: Colors.white,
                    textColor: Colors.grey,
                  ),
                  GButton(
                    icon: Icons.favorite,
                    text: "Favorites",
                    iconColor: Colors.white,
                    textColor: Colors.grey,
                  ),
                  GButton(
                    icon: Icons.settings_outlined,
                    text: "Settings",
                    iconColor: Colors.white,
                    textColor: Colors.grey,
                  )
                ],
                // mouseCursor: MaterialStateMouseCursor.textable,
                // selectedIconTheme: const IconThemeData(color: Colors.white),
                // unselectedItemColor: Colors.white38,
                // selectedItemColor: Colors.white,
              ),
            ),
          );
        });
  }
}
