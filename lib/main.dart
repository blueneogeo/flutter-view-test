import 'package:flutter/material.dart';
import 'package:tester/app-model.dart';
import 'package:tester/pages/home/home.dart';

void main() {
  runApp(TestApp());
}

class TestApp extends StatelessWidget {
  final model = AppModel();

  @override
  build(context) => HomePage(model: model);
}
