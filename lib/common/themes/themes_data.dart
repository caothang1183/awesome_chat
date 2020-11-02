import 'package:chatting_with_nncthang/common/constants/strings.dart';
import 'package:flutter/material.dart';

class ThemeColor {
  Color backgroundColor;
  Color buttonColor;
  Color titleColor;
  Color titleShadowColor;
  Color textColor;
  Color primaryColor;
  List<Shadow> shadow;

  ThemeColor({
    this.backgroundColor,
    this.buttonColor,
    this.textColor,
    this.primaryColor,
    this.titleColor,
    this.titleShadowColor,
    this.shadow,
  });
}

ThemeData darkThemeData() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.grey,
    primaryColor: Color(0xFF1E1F28),
    brightness: Brightness.dark,
    backgroundColor: Color(0xFF26242E),
    fontFamily: Fonts.Oswald,
    scaffoldBackgroundColor: Color(0xFF26242E),
  );
}

ThemeData lightThemeData() {
  return ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: Fonts.Oswald,
    backgroundColor: Color(0xFFFFFFFF),
    scaffoldBackgroundColor: Color(0xFFFFFFFF).withOpacity(0.9),
  );
}

ThemeColor darkMode() {
  return ThemeColor(
      titleColor: Colors.redAccent,
      titleShadowColor: Colors.white,
      primaryColor: Colors.redAccent,
      textColor: Color(0xDDFFFFFF),
      buttonColor: Color(0xFF34323D),
      backgroundColor: Color(0xFF222029),
      shadow: [
        BoxShadow(
          color: Color(0x66000000),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ].toList());
}

ThemeColor lightMode() {
  return ThemeColor(
      titleColor: Colors.blue,
      titleShadowColor: Color(0xFFC2C2C2),
      textColor: Color(0x8A000000),
      primaryColor: Colors.blue,
      buttonColor: Colors.grey.withOpacity(0.3),
      backgroundColor: Color(0xFFE7E7E8),
      shadow: [
        BoxShadow(
          color: Color(0xFFD8D7DA),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 2),
        ),
      ].toList());
}
