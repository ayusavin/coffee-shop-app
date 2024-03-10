import 'package:coffee_shop/src/core/usecase.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/product_repository.dart';
import 'package:coffee_shop/src/features/main_screen/domain/models/category.dart';
import 'package:coffee_shop/src/features/main_screen/domain/models/product.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class ListProductsByCategoryUseCase
    implements
        UseCase<Stream<Either<Exception, Product>>,
            ListProductsByCategoryParams> {
  final ProductRepository _repository;

  ListProductsByCategoryUseCase({required ProductRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, Stream<Either<Exception, Product>>>> call(
      ListProductsByCategoryParams params) {
    final products = _repository
        .list(ProductRepositoryFilters(category: params.category.name));

    return Future.value(Right(products));
  }
}

class ListProductsByCategoryParams extends Equatable {
  final Category category;

  const ListProductsByCategoryParams({required this.category});

  @override
  List<Object?> get props => [category];
}
