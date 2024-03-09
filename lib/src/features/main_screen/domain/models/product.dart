import 'package:coffee_shop/src/core/models/deserializable.dart';
import 'package:coffee_shop/src/core/errors/exception.dart';
import 'package:equatable/equatable.dart';

import 'price.dart';
import 'category.dart';

class Product extends Equatable implements Deserializable {
  final int id;
  final String name;
  final String description;
  final String? imageUrl;
  final Price price;
  final Category category;

  const Product(
      {required this.id,
      required this.name,
      required this.description,
      this.imageUrl,
      required this.price,
      required this.category});

  @override
  factory Product.fromJson(Map<String, dynamic> map) {
    if (map
        case {
          'id': final int id,
          'name': final String name,
          'description': final String description,
          'imageUrl': final String? imageUrl,
          'price': final Map<String, dynamic> price,
          'category': final Map<String, dynamic> category
        }) {
      return Product(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          price: Price.fromJson(price),
          category: Category.fromJson(category));
    } else {
      throw ValidationException(model: Price, data: map);
    }
  }

  @override
  List<Object?> get props => [id];
}
