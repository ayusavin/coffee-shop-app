import 'package:coffee_shop/src/features/main_screen/data/models/category.dart';
import 'package:coffee_shop/src/features/main_screen/data/models/product.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/category_repository.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/product_repository.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/mock_category_repository.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/mock_product_repository.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  List<Product> mockProducts = [];

  serviceLocator.registerSingleton<ProductRepository>(
      MockProductRepository(data: mockProducts));

  List<Category> mockCategories = [];

  serviceLocator.registerSingleton<CategoryRepository>(
      MockCategoryRepository(data: mockCategories));
}
