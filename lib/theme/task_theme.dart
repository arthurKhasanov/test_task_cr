import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double largeTextSize = 56;
const double mediumTextSize = 18;

class TaskTheme {
  //Светлая тема
  static final lightTheme = ThemeData(
    textTheme:  TextTheme(bodyText2: taskTextStyleLight),
    appBarTheme:  AppBarTheme(
      titleTextStyle: appBarTextStyleLight,
      backgroundColor: Colors.white,
    ),
    colorScheme: const ColorScheme.light(),
    scaffoldBackgroundColor: Colors.white,
  );

  //Темная тема
  static final darkTheme = ThemeData(
    textTheme:  TextTheme(bodyText2: taskTextStyleDark),
    appBarTheme:  AppBarTheme(
      titleTextStyle: appBarTextStyleDark,
      backgroundColor: const Color.fromRGBO(30, 31, 37, 1),
    ),
    colorScheme: const ColorScheme.dark(),
    scaffoldBackgroundColor: const Color.fromRGBO(30, 31, 37, 1),
  );
}

// 
final appBarTextStyleLight = GoogleFonts.inter(
  color: Colors.black,
  fontSize: largeTextSize,
  fontWeight: FontWeight.w800,
);
final taskTextStyleLight = GoogleFonts.inter(
  color: Colors.black,
  fontSize: mediumTextSize,
  fontWeight: FontWeight.w500,
);
final appBarTextStyleDark = GoogleFonts.inter(
  color: Colors.white,
  fontSize: largeTextSize,
  fontWeight: FontWeight.w800,
);
final taskTextStyleDark = GoogleFonts.inter(
  color: Colors.white,
  fontSize: mediumTextSize,
  fontWeight: FontWeight.w500,
);
