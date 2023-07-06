import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
      ),
      body: Column(
        children: [
          SettingsName(
            titleData: "Notification",
            subtitleData: "to get notification",
          ),
          SettingsName(
            titleData: "Terms and Condition",
            subtitleData: "All the stuff you need to know",
          ),
          SettingsName(
            titleData: "Privacy Policy",
            subtitleData: "Important for both of us",
          ),
          SettingsName(
            titleData: "Share the App",
            subtitleData: "shareeee....!!!",
          ),
          SettingsName(
            titleData: "Third party Application",
            subtitleData: "......!!!!",
          ),
          SettingsName(
            titleData: "About",
            subtitleData: "About the App",
          ),
        ],
      ),
    );
  }
}

class SettingsName extends StatelessWidget {
  const SettingsName(
      {super.key, required this.titleData, required this.subtitleData});
  final String titleData;
  final String subtitleData;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(titleData),
      subtitle: Text(subtitleData),
      trailing: Icon(Icons.arrow_forward),
    );
  }
}
