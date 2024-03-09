import 'package:coffee_shop/src/features/main_screen/data/models/category.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/category_repository.dart';

class MockCategoryRepository implements CategoryRepository {
  final List<Category> _categories;

  MockCategoryRepository({required List<Category> data}) : _categories = data;

  @override
  Stream<Category> list() {
    return Stream.fromIterable(_categories);
  }
}
