import 'package:coffee_shop/src/features/main_screen/domain/models/category.dart';
import 'package:dartz/dartz.dart';

abstract class CategoryRepository {
  Stream<Either<Exception, Category>> list();
}
