import 'dart:math';
import 'dart:ui';
import 'package:domain/usecases/get_categories_usecase.dart';

import 'package:get/get.dart';

class CategoryController extends GetxController {
  final GetCategoriesUseCase getCategoriesUseCase;

  CategoryController(this.getCategoriesUseCase);

  final categories = [].obs;
  var showAll = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  void fetchCategories() async {
    final result = await getCategoriesUseCase();
    categories.value = result;
  }

  toggleShowAll() {
    showAll.value = !showAll.value;
  }

  Color getColor() {
    final Random random = Random();
    return Color.fromARGB(
      255, // Opacity (100%)
      random.nextInt(256), // Red value (0-255)
      random.nextInt(256), // Green value (0-255)
      random.nextInt(256), // Blue value (0-255)
    );
  }
}
