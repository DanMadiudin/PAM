import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/text_style.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(243, 244, 246, 1)),
      child: Row(children: [
        const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        const SizedBox(width: 14,),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: "Search doctor...",
              hintStyle: GoogleFonts.inter(
                textStyle: AppStyle.mainText.copyWith(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                ),
              ),
              isDense: true
            ),
          ),
        ),
      ]),
    );
  }
}
