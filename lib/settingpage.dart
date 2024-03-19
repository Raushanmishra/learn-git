import 'package:flutter/material.dart';

void main() {
  runApp(Settingspage());
}

class Settingspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SettingsPage(),
    );
  }
}

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  // Example settings
  bool notificationsEnabled = true;
  bool darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: <Widget>[
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: notificationsEnabled,
            onChanged: (value) {
              setState(() {
                notificationsEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Dark Mode'),
            value: darkModeEnabled,
            onChanged: (value) {
              setState(() {
                darkModeEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Account Settings'),
            onTap: () {
              // Navigate to the account settings page
              // You can customize this action according to your needs.
            },
          ),
          ListTile(
            title: Text('Privacy Policy'),
            onTap: () {
              // Navigate to the privacy policy page or open a web link
              // You can customize this action according to your needs.
            },
          ),
        ],
      ),
    );
  }
}
