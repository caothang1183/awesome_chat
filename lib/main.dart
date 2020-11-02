import 'package:chatting_with_nncthang/common/themes/theme_changer.dart';
import 'package:chatting_with_nncthang/screens/app.dart';
import 'package:path_provider/path_provider.dart' as path;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final directory = await path.getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  final settings = await Hive.openBox("settings");
  bool enableDarkMode = settings.get("enableDarkMode") ?? true;
  print("Dark Mode: $enableDarkMode");
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(
        enableDarkMode: enableDarkMode,
      ),
      child: AppStart(),
    ),
  );
}

class AppStart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    return App(themeProvider: themeProvider);
  }
}
