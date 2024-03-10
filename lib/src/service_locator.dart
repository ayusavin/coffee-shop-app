import 'package:coffee_shop/src/core/usecase.dart';
import 'package:coffee_shop/src/features/main_screen/domain/models/category.dart';
import 'package:coffee_shop/src/features/main_screen/domain/models/product.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/category_repository.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/product_repository.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/mock_category_repository.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/mock_product_repository.dart';
import 'package:coffee_shop/src/features/main_screen/domain/services/list_categories.dart';
import 'package:coffee_shop/src/features/main_screen/domain/services/list_products_by_category.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> init() async {
  // Register repositories
  List<Product> mockProducts = [];

  serviceLocator.registerSingleton<ProductRepository>(
      MockProductRepository(data: mockProducts));

  List<Category> mockCategories = [];

  serviceLocator.registerSingleton<CategoryRepository>(
      MockCategoryRepository(data: mockCategories));

  // Register usecases
  serviceLocator.registerFactory<UseCase>(
      () => ListCategoriesUseCase(repository: serviceLocator()),
      instanceName: "ListCategories");

  serviceLocator.registerFactory<UseCase>(
      () => ListProductsByCategoryUseCase(repository: serviceLocator()),
      instanceName: "ListProductsByCategory");
}
