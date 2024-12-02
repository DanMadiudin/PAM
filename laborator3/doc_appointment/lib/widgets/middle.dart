import 'package:doc_appointment/common/widgets/t_section_heading.dart';
import 'package:doc_appointment/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/widgets/category_item.dart';

class Middle extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());
  Middle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TSectionHeading(
          title: 'Categories',
          onPressed: () {
            categoryController.toggleShowAll(); // Schimbă afișarea completă sau parțială
          },
        ),
        Obx(() {
          final categories = categoryController.categories;
          final itemCount = categoryController.showAll.value
              ? categories.length
              : (categories.length < 8 ? categories.length : 8);

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              crossAxisSpacing: 20,
              mainAxisSpacing: 10,
            ),
            itemCount: itemCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return CategoryItem(
                iconPath: categories[index].icon!,
                title: categories[index].title!,
                color: categoryController.getColor(),
              );
            },
          );
        }),
      ],
    );
  }
}