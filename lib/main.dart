import 'package:flutter/material.dart';
import 'package:tester/app-model.dart';
import 'package:tester/pages/home/home.dart';

// This is the starting point of the app. It starts showing the TestApp widget
void main() {
  runApp(TestApp());
}

// This is our TestApp widget, the root of our app structure.
class TestApp extends StatelessWidget {
  // The model represents the data and logic in our app
  final model = AppModel();

  // the build method tells how to build our widget.
  // The actual building of the widget is defined in the HomePage method,
  // which we imported. We pass it the model to use.
  @override
  build(context) => HomePage(model: model);
}
