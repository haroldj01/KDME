import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kdmadeeasy/animations/fade_in_animation.dart';

class GuideBox extends StatelessWidget {
  const GuideBox({required this.isFirst, Key? key}) : super(key: key);

  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final heightPadding = size.height * 0.20;
    final widthtPadding = size.width * 0.10;
    return FadeInAnimation(
      child: AlertDialog(
        insetPadding: EdgeInsets.fromLTRB(widthtPadding, heightPadding, widthtPadding, heightPadding),
        content: Column(
          children: [
            if(isFirst) ... [
            Text('After Guessing the Translation,\n\nDouble Tap To Reveal Answer', textAlign: TextAlign.center,),
            Expanded(child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Image.asset('assets/images/GuideDoubleTap.png'),
            ))
      ]else ... [
        Expanded(
          child: Row(
            children: [
              GuideSwipe(isLeft: true,),
              GuideSwipe(isLeft: false,),
            ],
          ),
        )
            ]
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          SizedBox(
            width: size.width * 0.50,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(onPressed: (){
                Navigator.maybePop(context);
              }, child: Text('Got It!')),
            ),
          )
        ],
      ),
    );
  }
}

class GuideSwipe extends StatelessWidget {
  const GuideSwipe({required this.isLeft,
    super.key,
  });

  final bool isLeft;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          isLeft ? Text('Swipe Left\nif You Guessed Incorrectly', textAlign: TextAlign.left,) :
          Text('Swipe Right\nif You Guessed Correctly', textAlign: TextAlign.right,),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: isLeft ? Image.asset('assets/images/GuideLeftSwipe.png') :
            Image.asset('assets/images/GuideRightSwipe.png')
          ))
        ],
      ),
    );
  }
}
