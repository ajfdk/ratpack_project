import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  bool _notificationsEnabled = false;
  bool _pinProtectionEnabled = false;
  String _pin = '1234'; // Default PIN
  String _backgroundImage = 'assets/dino.jpg'; // Default background

  ThemeProvider(this._themeData) {
    _loadPreferences();
  }

  ThemeData get themeData => _themeData;

  bool get notificationsEnabled => _notificationsEnabled;

  bool get pinProtectionEnabled => _pinProtectionEnabled;

  String get pin => _pin;

  String get backgroundImage => _backgroundImage;

  void toggleTheme() {
    if (_themeData == ThemeData.light()) {
      _themeData = ThemeData.dark();
    } else {
      _themeData = ThemeData.light();
    }
    notifyListeners();
  }

  void toggleNotifications() {
    _notificationsEnabled = !_notificationsEnabled;
    notifyListeners();
  }

  void togglePinProtection() {
    _pinProtectionEnabled = !_pinProtectionEnabled;
    notifyListeners();
  }

  void setPin(String newPin) {
    _pin = newPin;
    notifyListeners();
  }

  void setBackgroundImage(String imagePath) {
    _backgroundImage = imagePath;
    notifyListeners();
    _savePreferences();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _backgroundImage =
        prefs.getString('backgroundImage') ?? 'assets/dino.jpg';
    notifyListeners();
  }

  void _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('backgroundImage', _backgroundImage);
  }
}
