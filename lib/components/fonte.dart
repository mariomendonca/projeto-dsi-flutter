import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

quicksand({color, fontSize, fontWeight}) {
  return GoogleFonts.quicksand(
      decoration: TextDecoration.none,
      textStyle:
          TextStyle(fontSize: fontSize, color: color, fontWeight: fontWeight));
}
