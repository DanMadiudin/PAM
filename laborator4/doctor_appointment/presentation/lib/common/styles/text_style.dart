import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppStyle {
   static TextStyle mainText = GoogleFonts.inter(
      fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black
   );
   static TextStyle carouselText = GoogleFonts.inter(
      fontSize: 12, color: Colors.white, fontWeight: FontWeight.w400,
   );
   static TextStyle title = GoogleFonts.inter(
      fontSize: 16 , color: const Color.fromRGBO(28, 42, 58, 1), fontWeight: FontWeight.w700,
   );
   static TextStyle seeAll = GoogleFonts.inter(
      fontSize: 14 , color: const Color.fromRGBO(107, 114, 128, 1), fontWeight: FontWeight.w500,
   );
   static TextStyle category = GoogleFonts.inter(
      fontSize: 12 , color: const Color.fromRGBO(75, 85, 99, 1), fontWeight: FontWeight.w700,
   );
}