import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdmadeeasy/components/app/custom_appbar.dart';
import 'package:kdmadeeasy/components/flashcards_page/card_1.dart';
import 'package:kdmadeeasy/components/flashcards_page/card_2.dart';
import 'package:kdmadeeasy/components/flashcards_page/progress_bar.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FlashcardsPage extends StatefulWidget {
  const FlashcardsPage({super.key});

  @override
  State<FlashcardsPage> createState() => _FlashcardsPageState();
}

class _FlashcardsPageState extends State<FlashcardsPage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final flashCardsNotifier =  Provider.of<FlashcardsNotifier>(context, listen: false);
      flashCardsNotifier.runSlideCard1();
      flashCardsNotifier.generateAllSelectedWords();
      flashCardsNotifier.generateCurrentWord(context: context);
      SharedPreferences.getInstance().then((prefs) {
        if(prefs.getBool('guidebox') == null){
          runGuideBox(context: context, isFirst: true);
        }
      });

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(kAppBarHeight),
            child: CustomAppBar()),
        body: IgnorePointer(
          ignoring: notifier.ignoreTouches,
          child: Stack(
            children: [
              Align(
                  alignment: Alignment.bottomCenter,
                  child: ProgressBar()),
              Card2(),
              Card1(),
            ],
          ),
        ),
      ),
    );
  }
}
