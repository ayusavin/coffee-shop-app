import 'package:coffee_shop/src/features/main_screen/data/models/category.dart';

abstract class CategoryRepository {
  Stream<Category> list();
}
