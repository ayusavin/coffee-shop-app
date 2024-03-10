import 'package:coffee_shop/src/features/main_screen/domain/models/category.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/category_repository.dart';
import 'package:dartz/dartz.dart';

class MockCategoryRepository implements CategoryRepository {
  final List<Category> _categories;

  MockCategoryRepository({required List<Category> data}) : _categories = data;

  @override
  Stream<Either<Exception, Category>> list() {
    return Stream.fromIterable(_categories.map((product) => Right(product)));
  }
}
