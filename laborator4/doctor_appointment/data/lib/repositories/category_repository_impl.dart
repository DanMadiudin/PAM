import 'package:data/datasource/category_local_json_datasource.dart';
import 'package:data/mappers/category_mapper.dart';
import 'package:data/models/category_model.dart';
import 'package:domain/entities/category.dart';
import 'package:domain/repositories/category_repository.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryLocalJsonDataSource categoryDataSource;

  CategoryRepositoryImpl(this.categoryDataSource);

  @override
  Future<List<Category>> getCategories() async {
    final List<CategoryModel> categoryModels = await categoryDataSource.getCategories();

    return CategoryMapper.toEntityList(categoryModels);
  }
}
