import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mytheme {
  static ThemeData lighttheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          // ignore: deprecated_member_use
        ),
      );

  static ThemeData darktheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
      );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkcolor = const Color(0x0000ff40);
}
