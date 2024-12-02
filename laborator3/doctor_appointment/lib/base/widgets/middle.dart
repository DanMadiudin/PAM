import 'package:doctor_app/base/components/tab_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import '../common/widgets/t_section_heading.dart';
import '../common/widgets/tab.dart';

class Middle extends StatefulWidget {
  const Middle({super.key});

  @override
  State<Middle> createState() => _MiddleState();
}

class _MiddleState extends State<Middle> {
  List<Category> categoryItems = []; // Lista pentru stocarea item-urilor din JSON
  // State variable to track if the option has been pressed
  bool isCollapsed = true;

  void _toggleCollapse() {
    setState(() {
      isCollapsed = !isCollapsed; // Toggle the collapse state
    });
  }

  @override
  void initState() {
    super.initState();
    loadCategories(); // Încarcă bannerele la inițializare
  }

  Future loadCategories() async{
    String json = await rootBundle.loadString('assets/v1.json');
    Map<String, dynamic> data = jsonDecode(json);

    setState(() {
      categoryItems = (data['categories'] as List)
        .map((item)=> Category.fromJson(item))
        .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: 'Categories',
          onPressed: _toggleCollapse,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, // Number of columns
            childAspectRatio: 1, // Adjust the aspect ratio for layout
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
          ),
          itemCount: isCollapsed
              ? (categoryItems.length < 8 ? categoryItems.length : 8)
              : categoryItems.length, // Display based on the option pressed
          shrinkWrap: true, // Shrink the grid to fit the content
          physics: const NeverScrollableScrollPhysics(), // Disable scrolling
          itemBuilder: (context, index) {
            return CustomTab(
              iconPath: categoryItems[index].icon,
              title: categoryItems[index].title,
              color: categoryItems[index].color,
            );
          },
        ),
      ],
    );
  }
}
