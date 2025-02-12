import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kdmadeeasy/components/app/guide_box.dart';
import 'package:kdmadeeasy/components/app/quick_box.dart';
import 'package:kdmadeeasy/enums/language_type.dart';
import 'package:kdmadeeasy/enums/settings.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/notifiers/settings_notifier.dart';
import 'package:kdmadeeasy/pages/flashcards_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

loadSession({required BuildContext context, required String topic}){
  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => FlashcardsPage()));
  Provider.of<FlashcardsNotifier>(context, listen: false).setTopic(topic: topic);
}

extension SettingsToText on Settings {

  String toText(){
    switch(this){
      case Settings.englishFirst:
        return 'Show English First';
      case Settings.showKadazan:
        return 'Show Kadazan';
    }
  }
}

extension LanguageSymbol on LanguageType {

  String toSymbol(){
    switch(this){
        case LanguageType.image:
        return '🖼️';
      case LanguageType.english:
        return 'ENG';
      case LanguageType.kadazan:
        return 'KDZ';
    }
  }

}

updatePreferencesOnRestart({required BuildContext context}){
  final settingsNotifier = Provider.of<SettingsNotifier>(context, listen: false);

  for(var e in settingsNotifier.displayOptions.entries){
    SharedPreferences.getInstance().then((prefs) {
      final result = prefs.getBool(e.key.name);
      if(result != null) {
        settingsNotifier.displayOptions.update(e.key, (value) => result);
      }
    });
  }
}

clearPreferences(){
  SharedPreferences.getInstance().then((prefs) {
    for(var e in SettingsNotifier().displayOptions.entries){
      prefs.remove(e.key.name);
      prefs.remove('poppup');
      prefs.remove('guidebox');
    }
  });
}

runGuideBox({required BuildContext context, required bool isFirst}){

  if(!isFirst) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool('guidebox', true);
    });
  }

  Future.delayed(Duration(milliseconds: 1200),(){
    showDialog(context: context, builder: (context) => GuideBox(isFirst: isFirst,));
  });

}

runQuickBox({required BuildContext context, required String text}){

  showDialog(
    barrierDismissible: false,
      context: context, builder: (context) => QuickBox(text: text));
  Future.delayed(Duration(milliseconds: 1000),(){
    Navigator.maybePop(context);
  });
}