import 'package:flutter/material.dart';
import 'package:tester/app-model.dart';
import 'package:tester/pages/animations/animations.dart';
import 'package:tester/pages/home/home.dart';
import 'package:tester/pages/test/test.dart';
import 'package:tester/test-model.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  final model = AppModel();
  @override
  // build(context) => TestPage(model: model);
  build(context) => HomePage(app: model);
  // build(context) => AnimationsPage(model: model);
}
