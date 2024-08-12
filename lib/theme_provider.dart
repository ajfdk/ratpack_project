import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  // ThemeData _themeData;
  bool _notificationsEnabled = false;
  bool _pinProtectionEnabled = false;
  String _pin = '1234';  // Default PIN

  final String key = "theme";
  late SharedPreferences _prefs;
  bool _isDarkTheme = false;

  ThemeProvider(this._isDarkTheme) {
    _loadFromPrefs();
  }
  
  bool get isDarkTheme => _isDarkTheme;

  // ThemeData get themeData => _themeData;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get pinProtectionEnabled => _pinProtectionEnabled;
  String get pin => _pin;

  Future<void> loadThemeFromPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    _isDarkTheme = _prefs.getBool(key) ?? false;
    notifyListeners();
  }

  toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    _saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  _loadFromPrefs() async {
    await _initPrefs();
    _isDarkTheme = _prefs.getBool(key) ?? false;
    notifyListeners();
  }

  _saveToPrefs() async {
    await _initPrefs();
    _prefs.setBool(key, _isDarkTheme);
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
}
