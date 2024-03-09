import 'package:coffee_shop/src/core/models/deserializable.dart';
import 'package:coffee_shop/src/core/errors/exception.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable implements Deserializable {
  final int id;
  final String name;

  const Category({required this.id, required this.name});

  @override
  factory Category.fromJson(Map<String, dynamic> map) {
    if (map case {'id': final id, 'name': final name}) {
      return Category(id: id, name: name);
    } else {
      throw ValidationException(model: Category, data: map);
    }
  }

  @override
  List<Object?> get props => [id];
}
