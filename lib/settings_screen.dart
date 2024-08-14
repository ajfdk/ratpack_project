import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tamagotchi/background.dart';
import 'theme_provider.dart';
import 'pcontrols.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BackgroundContainer(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            title: Text('Settings'),
            backgroundColor: Colors.transparent,
            elevation: 0,
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
            title: Text('Background Image'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BackgroundImageScreen()),
              );
            },
          ),
        ],
      ),
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

class BackgroundImageScreen extends StatelessWidget {
  final List<String> images = [
    'assets/bubbles1.webp',
    'assets/bluebub.jpg',
    'assets/dino.jpg',
    'assets/weather.webp',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Background Image'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Provider.of<ThemeProvider>(context, listen: false).setBackgroundImage(images[index]);
              Navigator.pop(context);
            },
            child: Image.asset(
              images[index],
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }
}
