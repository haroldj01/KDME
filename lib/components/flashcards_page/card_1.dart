import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kdmadeeasy/animations/half_flip_animation.dart';
import 'package:kdmadeeasy/animations/slide_animation.dart';
import 'package:kdmadeeasy/components/flashcards_page/card_display.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/enums/slide_direction.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Card1 extends StatelessWidget {
  const Card1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onDoubleTap: (){
          notifier.runFlipCard1();
          notifier.setIgnoreTouch(ignore: true);
          SharedPreferences.getInstance().then((prefs) {
            if(prefs.getBool('guidebox') == null){
              runGuideBox(context: context, isFirst: false);
            }
          });
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard1,
          reset: notifier.resetFlipCard1,
          flipFromHalfWay: false,
          animationCompleted: (){
            notifier.resetCard1();
            notifier.runFlipCard2();
          },
          child: SlideAnimation(
            animationDuration: 1000,
            animationDelay: 200,
            animationCompleted: (){
              notifier.setIgnoreTouch(ignore: false);
            },
            reset: notifier.resetSlideCard1,
            animate: notifier.slideCard1 && !notifier.isRoundCompleted,
            direction: SlideDirection.upIn,
            child: Center(
              child: Container(
                width: size.width * 0.90,
                height: size.height * 0.70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kCircularBorderRadius),
                  border: Border.all(
                    color: Colors.white,
                    width: kCardBorderWidth,
                  ),
                  color: Theme.of(context).primaryColor,
                ),
                child: CardDisplay(isCard1: true,),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
