import 'package:flutter/material.dart';
import 'package:kdmadeeasy/enums/language_type.dart';
import 'package:kdmadeeasy/notifiers/review_notifier.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:provider/provider.dart';

class LanguageButton extends StatelessWidget {
  const LanguageButton({required this.languageType, this.isDisabled = false,
    super.key,
  });

  final LanguageType languageType;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return Expanded(child: Padding(
      padding: const EdgeInsets.fromLTRB(6, 1, 6, 1),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor
          ),
          onPressed: isDisabled ? null : (){
            Provider.of<ReviewNotifier>(context, listen: false)
                .updateShowLanguage(language: languageType);
          }, child: Text(languageType.toSymbol())),
    ));
  }
}
