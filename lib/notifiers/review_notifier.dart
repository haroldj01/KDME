import 'package:flutter/cupertino.dart';
import 'package:kdmadeeasy/enums/language_type.dart';

class ReviewNotifier extends ChangeNotifier {
  bool showImage = true,
  showEnglish = true,
  showKadazan = false,
  buttonsAreDisabled = false;

  disabledButtons({required bool disabled}){
    buttonsAreDisabled = disabled;
    notifyListeners();
  }

  updateShowLanguage({required LanguageType language}){
    switch(language){
      case LanguageType.image:
      showImage = !showImage;
      break;
      case LanguageType.english:
        showEnglish = !showEnglish;
        break;
      case LanguageType.kadazan:
        showKadazan = !showKadazan;
        break;
    }

    notifyListeners();
  }
}