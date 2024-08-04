import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'points_storage.dart';
import 'theme_provider.dart';
import 'pcontrols.dart';

class SettingsScreen extends StatelessWidget {
  final PointsStorage storage = PointsStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: Text('Enable Notifications'),
            value: Provider.of<ThemeProvider>(context).notificationsEnabled,
            onChanged: (bool value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleNotifications();
            },
          ),
          SwitchListTile(
            title: Text('Enable Dark Mode'),
            value: Provider.of<ThemeProvider>(context).themeData == ThemeData.dark(),
            onChanged: (bool value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          ListTile(
            title: Text('Account Settings'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('Parental Controls'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParentalControlsScreen()),
              );
            },
          ),
          ListTile(
            title: Text('DELETE APPDATA'),
            tileColor: Colors.red,
            onTap: storage.deleteDocumentsDirectory,
          )
        ],
      ),
    );
  }
}

class AccountSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Settings'),
      ),
      body: Center(
        child: Text('Account Settings Page'),
      ),
    );
  }
}
