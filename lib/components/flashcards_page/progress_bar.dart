import 'package:flutter/material.dart';
import 'package:kdmadeeasy/configs/constants.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:provider/provider.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({super.key});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Selector<FlashcardsNotifier, double>(
      selector: (_, notifier) => notifier.percentComplete,
      builder: (_, percentComplete, __) {
        _animation = Tween<double>(begin: _animation.value, end: percentComplete).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOutCirc),
        );
        _controller.forward(from: 0.0);

        return AnimatedBuilder(
          animation: _animation,
          builder: (context, child) => Padding(
            padding: EdgeInsets.all(size.width * 0.05),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(kCircularBorderRadius),
              child: LinearProgressIndicator(
                minHeight: size.height * 0.03,
                value: _animation.value,
              ),
            ),
          ),
        );
      },
    );
  }
}
