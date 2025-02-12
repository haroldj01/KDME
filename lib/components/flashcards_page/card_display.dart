import 'package:flutter/material.dart';
import 'package:kdmadeeasy/enums/settings.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/notifiers/settings_notifier.dart';
import 'package:provider/provider.dart';

class CardDisplay extends StatelessWidget {
  const CardDisplay({
    required this.isCard1,
    Key? key,
  }) : super(key: key);

  final bool isCard1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: Consumer<SettingsNotifier>(
        builder: (_, notifier, __) {

          final setEnglishFirst = notifier.displayOptions.entries.firstWhere((element) =>
          element.key == Settings.englishFirst).value;

          final showKadazan = notifier.displayOptions.entries.firstWhere((element) =>
          element.key == Settings.showKadazan).value;

          return Consumer<FlashcardsNotifier>(
            builder: (_, notifier, __) => isCard1 ? Column(
              children: [
                if(setEnglishFirst) ... [
                  buildImage(notifier.word1.english),
                  buildTextBox(notifier.word1.english, context, 1),
                ] else ... [
                    showKadazan ? buildTextBox(notifier.word1.kadazan, context, 1) : SizedBox()
                  ]

              ],
            )
                : Column(
              children: [
                if(setEnglishFirst) ... [
                  buildImage(notifier.word2.english),
                  showKadazan ? buildTextBox(notifier.word2.kadazan, context, 1) : SizedBox(),
                ] else
                  ... [
                    buildImage(notifier.word2.english),
                    buildTextBox(notifier.word2.english, context, 1),
                  ]

              ],
            ),
          );
        },
      ),
    );
  }

  Expanded buildImage(String image) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Image.asset('assets/images/$image.png'),
      ),
    );
  }

  Expanded buildTextBox(String text, BuildContext context, int flex) {
    return Expanded(
        flex: flex,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: FittedBox(
            child: Text(text,
              style: Theme
                  .of(context).textTheme.headline1,
            ),
          ),
        ));
  }
}