import 'package:flutter/material.dart';
import 'package:kdmadeeasy/configs/themes.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/notifiers/review_notifier.dart';
import 'package:kdmadeeasy/notifiers/settings_notifier.dart';
import 'package:kdmadeeasy/pages/main_menu.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => FlashcardsNotifier()),
      ChangeNotifierProvider(create: (_) => SettingsNotifier()),
      ChangeNotifierProvider(create: (_) => ReviewNotifier()),
    ],
    child: MyApp(), // Remove 'const' keyword
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    updatePreferencesOnRestart(context: context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KDMadeEasy',
      theme: appTheme,
      home: MainMenuPage(), // Remove 'const' keyword
    );
  }
}
