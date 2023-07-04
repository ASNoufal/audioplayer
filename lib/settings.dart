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
          ListTile(
            title: Text("Notification"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Nick Name"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Terms and Condition"),
            subtitle: Text("All the stuff you need to know"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Privacy Policy"),
            subtitle: Text("Important for both of us"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Share the App"),
            subtitle: Text("shareeee....!!!"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("Third party Application"),
            subtitle: Text("......!!!!"),
            trailing: Icon(Icons.arrow_forward),
          ),
          ListTile(
            title: Text("About"),
            subtitle: Text("About the App"),
            trailing: Icon(Icons.arrow_forward),
          )
        ],
      ),
    );
  }
}
