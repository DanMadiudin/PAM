import 'package:flutter/material.dart';

class TDivider extends StatelessWidget {
  const TDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      // Adăugăm o linie după rating
      thickness: 1.5, // Grosimea liniei
      height: 20,
      color: Color.fromRGBO(229, 231, 235, 1), // Culoarea liniei
    );
  }
}
