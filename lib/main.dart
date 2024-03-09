import 'package:flutter/material.dart';

import 'src/app.dart';
import 'src/service_locator.dart' as sl;

void main() async {
  await sl.init();
  runApp(const MyApp());
}
