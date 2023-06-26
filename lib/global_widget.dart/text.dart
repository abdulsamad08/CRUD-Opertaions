import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget textWidget(
    {required String text,
    double fontSize = 12,
    TextAlign textAlign = TextAlign.center,
    FontWeight fontWeight = FontWeight.normal,
    Color color = Colors.black}) {
  return Text(text,
      textAlign: textAlign,
      style: GoogleFonts.ptSans(
        textStyle: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
        ),
      ));
}