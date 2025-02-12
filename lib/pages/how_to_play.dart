import 'package:flutter/material.dart';
import 'package:kdmadeeasy/configs/constants.dart'; // Import the file where kCircularBorderRadius is defined

class HowToPlayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text('How to Play'),
        centerTitle: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kCircularBorderRadius), // Use the constant here
              color: Theme.of(context).primaryColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(0, 4),
                  blurRadius: 4,
                ),
              ],
              border: Border.all(
                color: Colors.white, // White outline
                width: 4, // Outline width
              ),
            ),
            padding: EdgeInsets.all(size.width * 0.05),
            child: Column(
              mainAxisSize: MainAxisSize.min, // Make the column size itself based on the content
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '1. AR Learn',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  'A fun way to learn the KadazanDusun language.\nScan the Flashcards to learn some words in KadazanDusun.\n\nYou may use the Flashcards provided in "Flashcards" page by taking snaps or screenshots.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.02,
                  ),
                ),
                SizedBox(height: size.height * 0.05),
                Text(
                  '2. QUIZ',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.03,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                Text(
                  'Test your knowledge on KadazanDusun and review progress.\n\nWhen a flashcard is shown, guess the translation and double tap to reveal answer.\n\nIf you guessed correctly, swipe right and if you guessed incorrectly, swipe left to save and review later.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: size.height * 0.02,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
