import 'package:flutter/material.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/models/word.dart';
import 'package:kdmadeeasy/notifiers/review_notifier.dart';
import 'package:provider/provider.dart';

class WordTile extends StatelessWidget {
  WordTile({required this.word, required this.animation, this.onPressed,
    required this.index,
    super.key,
  });

  final Word word;

  final Animation animation;
  final _tweenOffsetLeft = Tween<Offset>(begin: Offset(-1,0,), end: Offset(0,0));
  final _tweenOffsetRight = Tween<Offset>(begin: Offset(1,0,), end: Offset(0,0));
  final VoidCallback? onPressed;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation.drive(CurveTween(curve: Curves.easeInOutSine)).drive(
          index % 2 == 0 ? _tweenOffsetRight : _tweenOffsetLeft
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 3, 8, 3),
        child: Consumer<ReviewNotifier>(
          builder: (_, notifier, __) => Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(kCircularBorderRadius),
              border: Border.all(
                color: Colors.black,
                width: 2,
              )
            ),
            child: ListTile(
              leading: notifier.showImage ? SizedBox(
                  width: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/${word.english}.png'),
                  )) : SizedBox(),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  notifier.showEnglish ? Text(word.english) : SizedBox(),
                  notifier.showKadazan ? Text(word.kadazan) : SizedBox(),
                ],
              ),
              trailing: IconButton(icon: Icon(Icons.clear),onPressed: (){
                onPressed?.call();
              },),
            ),
          ),
        ),
      ),
    );
  }
}
