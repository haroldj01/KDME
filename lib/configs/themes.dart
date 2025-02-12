import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kdmadeeasy/configs/constants.dart';

final appTheme = ThemeData(
  primaryColor: kYellow,

  textTheme: TextTheme(
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: GoogleFonts.leagueSpartan().fontFamily
    ),
    displayLarge: TextStyle(
        color: Colors.black,
        fontSize: 58,
        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
        fontWeight: FontWeight.bold,
    ),
  ),

  appBarTheme: AppBarTheme(
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.leagueSpartan().fontFamily,
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    color: kYellow,
  ),
  scaffoldBackgroundColor: kDark,
  dialogTheme: DialogTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(kCircularBorderRadius),
    ),
    backgroundColor: kYellow,
    contentTextStyle: TextStyle(
        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
        fontSize: 20,
        color: Colors.black),
    titleTextStyle: TextStyle(
      fontFamily: GoogleFonts.leagueSpartan().fontFamily,
      fontSize: 20,
      color: Colors.black),),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kCircularBorderRadius),
        side: BorderSide(
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.white,
      textStyle: TextStyle(
        fontFamily: GoogleFonts.leagueSpartan().fontFamily,
        color: Colors.white,
        fontSize: 15
      )
    )
  ),

  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: kYellow,
    linearTrackColor: Colors.grey,
  ),
  switchTheme: SwitchThemeData(
    thumbColor: MaterialStateProperty.all<Color>(kYellow)
  ),
  listTileTheme: ListTileThemeData(
    textColor: Colors.black,
    iconColor: Colors.black,
  )
);