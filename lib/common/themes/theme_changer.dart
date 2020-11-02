import 'package:chatting_with_nncthang/common/themes/themes_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';

class ThemeProvider with ChangeNotifier {
  bool enableDarkMode;

  ThemeProvider({this.enableDarkMode});

  getCurrentState() {
    if (enableDarkMode) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarDividerColor: Color(0xFF000000),
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      );
    } else {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarDividerColor: Color(0xFFFFFFFF),
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      );
    }
  }

  toggleThemeData() async {
    final settings = await Hive.openBox("settings");
    settings.put("enableDarkMode", !enableDarkMode);
    enableDarkMode = !enableDarkMode;
    getCurrentState();
    notifyListeners();
  }

  getThemeData() {
    return enableDarkMode ? darkThemeData() : lightThemeData();
  }

  ThemeColor themeColor() {
    if (enableDarkMode) {
      return darkMode();
    }
    return lightMode();
  }
}
