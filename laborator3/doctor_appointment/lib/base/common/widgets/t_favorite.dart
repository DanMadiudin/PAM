import 'package:flutter/material.dart';

class TFavorite extends StatelessWidget {
  final bool isFavorite; // Starea favoritului
  final VoidCallback onToggle; // Funcția de toggle

  const TFavorite({super.key, required this.isFavorite, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      visualDensity: VisualDensity.compact,
      onPressed: onToggle, // Apelează funcția de toggle
      icon: isFavorite
          ? const Icon(Icons.favorite_rounded, color: Colors.red)
          : const Icon(Icons.favorite_border_rounded),
    );
  }
}
