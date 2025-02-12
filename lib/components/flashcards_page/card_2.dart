import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kdmadeeasy/animations/half_flip_animation.dart';
import 'package:kdmadeeasy/animations/slide_animation.dart';
import 'package:kdmadeeasy/components/flashcards_page/card_display.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/enums/slide_direction.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:provider/provider.dart';

class Card2 extends StatelessWidget {
  const Card2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => GestureDetector(
        onHorizontalDragEnd: (details) {
          if (details.primaryVelocity! > 100) {
            notifier.runSwipeCard2(direction: SlideDirection.leftAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord(context: context);
          }
          if (details.primaryVelocity! < -100) {
            notifier.runSwipeCard2(direction: SlideDirection.rightAway);
            notifier.runSlideCard1();
            notifier.setIgnoreTouch(ignore: true);
            notifier.generateCurrentWord(context: context);
          }
        },
        child: HalfFlipAnimation(
          animate: notifier.flipCard2,
          reset: notifier.resetFlipCard2,
          flipFromHalfWay: true,
          animationCompleted: () {
            notifier.setIgnoreTouch(ignore: false);
          },
          child: SlideAnimation(
            animationCompleted: () {
              notifier.resetCard2();
            },
            reset: notifier.resetSwipeCard2,
            animate: notifier.swipeCard2,
            direction: notifier.swipedDirection,
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
                child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationY(pi),
                    child: CardDisplay(
                      isCard1: false,
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
