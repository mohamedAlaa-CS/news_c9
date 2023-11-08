import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ApplicationTheme {
  static const Color primaryColor = Color(0xff39A552);
  static ThemeData myTheme = ThemeData(
      //scaffoldBackgroundColor: Colors.transparent,
      appBarTheme: AppBarTheme(
          color: primaryColor,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
              ),
              side: BorderSide(
                color: Colors.transparent,
              )),
          titleTextStyle: GoogleFonts.exo(color: Colors.white, fontSize: 22),
          elevation: 0.0));
}
