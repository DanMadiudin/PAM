import 'package:domain/entities/category.dart';
import 'package:domain/repositories/category_repository.dart';


class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<Category>> call() async {
    return await repository.getCategories();
  }
}