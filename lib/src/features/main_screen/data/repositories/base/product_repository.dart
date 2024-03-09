import 'package:coffee_shop/src/features/main_screen/data/models/product.dart';

class ProductRepositoryFilters {
  final String? category;

  ProductRepositoryFilters({
    this.category
  });
}

abstract class ProductRepository {
  Future<Product?> getById(int id);
  Stream<Product> list([ProductRepositoryFilters? filters]);
}