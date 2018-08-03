import 'package:flutter/material.dart';
import 'package:tester/app-model.dart';
import 'package:tester/pages/home/home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {

  final appModel = AppModel();
  
  @override
  build(context) => HomePage(model: appModel);

}
