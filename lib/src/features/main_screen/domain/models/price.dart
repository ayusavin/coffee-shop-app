import 'package:coffee_shop/src/core/errors/exception.dart';
import 'package:coffee_shop/src/core/models/deserializable.dart';
import 'package:equatable/equatable.dart';

class Price extends Equatable implements Deserializable {
  final String currency;
  final int value;

  const Price({
    required this.currency,
    required this.value,
  });

  @override
  List<Object?> get props => [currency, value];

  @override
  factory Price.fromJson(Map<String, dynamic> map) {
    if (map case {'currency': final currency, 'value': final value}) {
      return Price(currency: currency, value: value);
    } else {
      throw ValidationException(model: Price, data: map);
    }
  }
}
