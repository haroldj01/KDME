import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kdmadeeasy/animations/fade_in_animation.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/utils/methods.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({
    Key? key,
    required this.topic,
  }) : super(key: key);

  final String topic;

  @override
  Widget build(BuildContext context) {
    return FadeInAnimation(
      child: GestureDetector(
        onTap: (){
          print('tile tapped $topic');
          loadSession(context: context, topic: topic);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: BorderRadius.circular(kCircularBorderRadius),
          ),
          child: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Hero(
                        tag: topic,
                        child: Image.asset('assets/images/$topic.png')),
                  )),
              Expanded(child: Text(topic)),
            ],
          ),
        ),
      ),
    );
  }
}