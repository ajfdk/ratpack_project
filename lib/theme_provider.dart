import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData;
  bool _notificationsEnabled = false;
  bool _pinProtectionEnabled = false;
  String _pin = '1234';  // Default PIN

  ThemeProvider(this._themeData);

  ThemeData get themeData => _themeData;
  bool get notificationsEnabled => _notificationsEnabled;
  bool get pinProtectionEnabled => _pinProtectionEnabled;
  String get pin => _pin;

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
}
