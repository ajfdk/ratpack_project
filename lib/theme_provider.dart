import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  bool _notificationsEnabled = false;
  bool _pinProtectionEnabled = false;
  String _pin = '1234'; // Default PIN
  String _backgroundImage = 'assets/weather.webp'; // Default background
  String _currentUser = 'parent'; // Default user

  ThemeProvider(this._themeData) {
    _loadPreferences();
  }

  final String key = "theme";
  late SharedPreferences _prefs;
  bool _isDarkTheme = false;

  // ThemeProvider(this._isDarkTheme) {
  //   _loadFromPrefs();
  // }

  bool get isDarkTheme => _isDarkTheme;

  ThemeData get themeData => _themeData;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get pinProtectionEnabled => _pinProtectionEnabled;
  String get pin => _pin;
  String get backgroundImage => _backgroundImage;
  String get currentUser => _currentUser;

  void toggleTheme() {
    if (_themeData == ThemeData.light()) {
      _themeData = ThemeData.dark();
    } else {
      _themeData = ThemeData.light();
    }
    notifyListeners();
  }
  //   Future<void> loadThemeFromPrefs() async {
  //   _prefs = await SharedPreferences.getInstance();
  //   _isDarkTheme = _prefs.getBool(key) ?? false;
  //   notifyListeners();
  // }
  //
  // toggleTheme() {
  //   _isDarkTheme = !_isDarkTheme;
  //   _saveToPrefs();
  //   notifyListeners();
  // }

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

  void setBackgroundImage(String imagePath) {
    _backgroundImage = imagePath;
    notifyListeners();
    _savePreferences();
  }

  void setCurrentUser(String user) {
    _currentUser = user;
    _loadPreferences();
  }

  void _loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _backgroundImage = prefs.getString('${_currentUser}_backgroundImage') ?? 'assets/weather.webp';
    _themeData = (prefs.getBool('${_currentUser}_isDarkMode') ?? false) ? ThemeData.dark() : ThemeData.light();
    _pinProtectionEnabled = prefs.getBool('pin_protection_enabled') ?? false;
    _pin = prefs.getString('parent_pin') ?? '1234';
    notifyListeners();
  }

  void _savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('${_currentUser}_backgroundImage', _backgroundImage);
    await prefs.setBool('${_currentUser}_isDarkMode', _themeData == ThemeData.dark());
    await prefs.setBool('pin_protection_enabled', _pinProtectionEnabled);
    await prefs.setString('parent_pin', _pin);
  }
}
