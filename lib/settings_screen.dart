import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'points_storage.dart';
import 'theme_provider.dart';
import 'pcontrols.dart';

class SettingsScreen extends StatelessWidget {
  final PointsStorage storage = PointsStorage();
  @override
  Widget build(BuildContext context) {
    final themeNotifier = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Enable Notifications'),
            value: Provider.of<ThemeProvider>(context).notificationsEnabled,
            onChanged: (bool value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleNotifications();
            },
          ),
          SwitchListTile(
            title: const Text('Enable Dark Mode'),
            value: themeNotifier.isDarkTheme,
            onChanged: (bool value) {
              themeNotifier.toggleTheme();
            },
            secondary: Icon(
              themeNotifier.isDarkTheme ? Icons.nightlight_round : Icons.wb_sunny,
            ),
          ),

          ListTile(
            title: const Text('Account Settings'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AccountSettingsScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('Parental Controls'),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ParentalControlsScreen()),
              );
            },
          ),
          ListTile(
            title: const Text('DELETE APPDATA'),
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
        title: const Text('Account Settings'),
      ),
      body: const Center(
        child: Text('Account Settings Page'),
      ),
    );
  }
}
