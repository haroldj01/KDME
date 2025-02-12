import 'package:flutter/material.dart';
import 'package:kdmadeeasy/enums/settings.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsNotifier extends ChangeNotifier{
  Map<Settings, bool> displayOptions = {
    Settings.englishFirst : true,
    Settings.showKadazan : true,

  };

  updateDisplayOptions({required Settings displayOption, required bool isToggled}){
    displayOptions.update(displayOption, (value) => isToggled);
    SharedPreferences.getInstance().then((prefs) {
      prefs.setBool(displayOption.name, isToggled);
    });
    notifyListeners();
}

resetSettings(){
    displayOptions.update(Settings.englishFirst, (value) => true);
    displayOptions.update(Settings.showKadazan, (value) => true);
    clearPreferences();
    notifyListeners();
}

}