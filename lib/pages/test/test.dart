// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:tester/test-model.dart';
// ignore: unused_import
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// ignore: unused_import
import 'package:scoped_model/scoped_model.dart';

// ignore: non_constant_identifier_names
MaterialApp TestPage() {
  return MaterialApp(
    title: 'Flutter Demo!',
    home: Scaffold(
      appBar: AppBar(
        title: Container(
          child: Text(
            'Welcome'
          )
        )
      ),
      body: Center(
        child: ScopedModelDescendant<TestModel>(
          builder: (context, widget, model) {
            return DefaultTextStyle(
              child: AnimatedContainer(
                duration: Duration(milliseconds: 200),
                child: Column(
                  children: __flatten([
                    Text(
                      'Count: ${model.counter}'
                    ),
                    PlatformButton(
                      onPressed: () { model.incrementCounter(); },
                      child: Text(
                        'increase'
                      )
                    ),
                    PlatformButton(
                      onPressed: () { model.decrementCounter(); },
                      child: Text(
                        'decrease'
                      )
                    )
                  ])
                ),
                margin: EdgeInsets.only(top: (model.counter * 10).toDouble())
              ),
              style: TextStyle(
                fontSize: (20).toDouble(),
                color: Colors.black
              )
            );
          }
        )
      )
    )
  );
}
// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}