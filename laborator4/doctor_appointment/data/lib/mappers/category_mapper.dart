import 'package:data/models/category_model.dart';
import 'package:domain/entities/category.dart';

class CategoryMapper {
  static Category toEntity(CategoryModel model) {
    return Category(
      title: model.title ?? 'title', // Asigură-te că ai valori implicite pentru null
      icon: model.icon ?? 'icon',
    );
  }

  static List<Category> toEntityList(List<CategoryModel> models) {
    return models.map((model) => toEntity(model)).toList();
  }
}
