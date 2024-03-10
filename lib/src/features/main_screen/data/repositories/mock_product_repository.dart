import 'package:coffee_shop/src/features/main_screen/domain/models/product.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/product_repository.dart';
import 'package:dartz/dartz.dart';

class MockProductRepository implements ProductRepository {
  final List<Product> _products;

  MockProductRepository({required List<Product> data}) : _products = data;

  bool Function(Product) _buildQuery(ProductRepositoryFilters filters) {
    var filter = (Product _) => true;

    if (filters.category != null) {
      filter = (Product product) =>
          filter(product) && product.category.name == filters.category;
    }

    return filter;
  }

  @override
  Future<Either<Exception, Product?>> getById(int id) {
    Product? result;
    try {
      result = _products.singleWhere((element) => element.id == id);
    } on StateError catch (_) {}
    return Future.value(Right(result));
  }

  @override
  Stream<Either<Exception, Product>> list([ProductRepositoryFilters? filters]) {
    bool Function(Product)? query;

    if (filters != null) {
      query = _buildQuery(filters);
    }

    Iterable<Product> filteredResults =
        query != null ? _products.where(query) : _products;

    return Stream.fromIterable(
        filteredResults.map((product) => Right(product)));
  }
}
