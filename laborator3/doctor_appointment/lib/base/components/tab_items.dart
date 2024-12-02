import 'dart:math';
import 'package:flutter/material.dart';

class Category{
  String icon;
  String title;
  Color color;


  Category({required this.icon, required this.title, Color? color}): color = color ?? getRandomColor(); 

  static Color getRandomColor() { // Make it static to call without an instance
    final Random random = Random();
    return Color.fromARGB(
      255, // Opacity (100%)
      random.nextInt(256), // Red value (0-255)
      random.nextInt(256), // Green value (0-255)
      random.nextInt(256), // Blue value (0-255)
    );
  }

  Category.fromJson(Map<String, dynamic> json)
      : icon = json["icon"],
        title = json["title"],
        color = getRandomColor();

  Map<String, dynamic> toJson() =>
      {'icon': icon, 'title': title};
}
