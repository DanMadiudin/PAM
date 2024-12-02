import 'dart:convert';
import 'dart:io';

import 'package:data/mocks/category_mock_data.dart';
import 'package:data/models/category_model.dart';

abstract class CategoryLocalJsonDataSource {
  Future<List<CategoryModel>> getCategories();
}

class CategoryLocalJsonDataSourceImpl implements CategoryLocalJsonDataSource {
  @override
  Future<List<CategoryModel>> getCategories() async {
    try {
      String json = await File('assets/localData.json').readAsString();
      var result = jsonDecode(json);

      return (result['categories'] as List)
          .map((data) => CategoryModel.fromJson(data))
          .toList();
    } catch (e) {
      print('Error loading doctors: $e');
      await Future.delayed(Duration(seconds: 5));
      return categoriesMockData;
    }
  }
}
