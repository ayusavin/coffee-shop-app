import 'package:flutter/material.dart';

import 'package:coffee_shop/src/app.dart';
import 'package:coffee_shop/src/service_locator.dart' as sl;

void main() async {
  await sl.init();
  runApp(const MyApp());
}
