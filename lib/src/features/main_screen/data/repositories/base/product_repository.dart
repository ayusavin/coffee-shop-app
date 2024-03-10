import 'package:coffee_shop/src/features/main_screen/domain/models/product.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryFilters {
  final String? category;

  ProductRepositoryFilters({this.category});
}

abstract class ProductRepository {
  Future<Either<Exception, Product?>> getById(int id);
  Stream<Either<Exception, Product>> list([ProductRepositoryFilters? filters]);
}
