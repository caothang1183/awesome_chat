import 'package:chatting_with_nncthang/common/themes/theme_changer.dart';
import 'package:provider/provider.dart';

class Themes {
  static const String DARK = "Dark";
  static const String LIGHT = "Light";
}

ThemeProvider themeProviderSelector(context) => Provider.of<ThemeProvider>(context);
