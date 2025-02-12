import 'package:flutter/material.dart';
import 'package:kdmadeeasy/databases/database_manager.dart';
import 'package:kdmadeeasy/notifiers/flashcards_notifier.dart';
import 'package:kdmadeeasy/pages/flashcards_page.dart';
import 'package:kdmadeeasy/pages/quiz.dart';
import 'package:kdmadeeasy/utils/methods.dart';
import 'package:provider/provider.dart';

class ResultsBox extends StatefulWidget {
  const ResultsBox({super.key});

  @override
  State<ResultsBox> createState() => _ResultsBoxState();
}

class _ResultsBoxState extends State<ResultsBox> {

  bool _haveSavedCards = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlashcardsNotifier>(
      builder: (_, notifier, __) => AlertDialog(
        title: Text(
          notifier.isSessionCompleted ? 'Session Completed!' : 'Round Completed!',
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildStarRating(notifier.correctPercentage.toDouble()),
            Table(
              columnWidths: {
                0 : FlexColumnWidth(3),
                1 : FlexColumnWidth(1),
              },
              children: [
                buildTableRow(title: 'Total Rounds', stat: notifier.roundTally.toString()),
                buildTableRow(title: 'No. Cards', stat: notifier.cardTally.toString()),
                buildTableRow(title: 'No. Correct', stat: notifier.correctTally.toString()),
                buildTableRow(title: 'No. Incorrect', stat: notifier.incorrectTally.toString()),
              ],
            ),
          ],
        ),
        actions: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  notifier.isSessionCompleted
                      ? SizedBox()
                      : ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FlashcardsPage(),
                          ),
                        );
                      },
                      child: Text('Retest Incorrect Cards')),
                  notifier.isSessionCompleted
                      ? SizedBox()
                      : ElevatedButton(
                      onPressed: _haveSavedCards ? null : () async {
                        for(int i = 0; i < notifier.incorrectCards.length; i++){
                          await DatabaseManager().insertWord(word: notifier.incorrectCards[i]);
                          final words = await DatabaseManager().selectWords();
                          print(words.length);
                        }
                        _haveSavedCards = true;
                        runQuickBox(context: context, text: 'Incorrect Cards Saved!');
                        setState(() {

                        });
                      },
                      child: Text('Save Incorrect Cards')),
                  ElevatedButton(
                    onPressed: () {
                      notifier.reset();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                            (route) => false,
                      );
                    },
                    child: Text('Home'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Method to calculate number of stars based on correct percentage
  int _calculateStars(double correctPercentage) {
    if (correctPercentage == 100) return 5;
    else if (correctPercentage >= 76) return 4;
    else if (correctPercentage >= 51) return 3;
    else if (correctPercentage >= 26) return 2;
    else if (correctPercentage > 0) return 1;
    else return 0;
  }

  // Method to build the star rating widget
  Widget _buildStarRating(double correctPercentage) {
    int stars = _calculateStars(correctPercentage);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          index < stars ? Icons.star : Icons.star_border,
          color: Colors.amber,
        );
      }),
    );
  }

  TableRow buildTableRow({required String title, required String stat}) {
    return TableRow(
        children: [
          TableCell(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title),
          )),
          TableCell(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(stat, textAlign: TextAlign.right,),
          )),
        ]
    );
  }
}
