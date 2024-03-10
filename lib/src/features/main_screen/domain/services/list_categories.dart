import 'package:coffee_shop/src/core/usecase.dart';
import 'package:coffee_shop/src/features/main_screen/domain/models/category.dart';
import 'package:coffee_shop/src/features/main_screen/data/repositories/base/category_repository.dart';
import 'package:dartz/dartz.dart';

class ListCategoriesUseCase
    implements UseCase<Stream<Either<Exception, Category>>, EmptyParams> {
  final CategoryRepository _repository;

  ListCategoriesUseCase({required CategoryRepository repository})
      : _repository = repository;

  @override
  Future<Either<Exception, Stream<Either<Exception, Category>>>> call(
      EmptyParams params) {
    final stream = _repository.list();
    return Future.value(Right(stream));
  }
}
