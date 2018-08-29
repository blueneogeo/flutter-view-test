// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// ignore: unused_import
import 'package:scoped_model/scoped_model.dart';
// ignore: unused_import
import 'package:tester/app-model.dart';
// ignore: unused_import
import 'package:tester/util/controller_widget.dart';
// ignore: unused_import
import 'package:tester/util/reactive.dart';

// ignore: non_constant_identifier_names
MaterialApp HomePage({ @required app }) {
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
        child: Reactive(
          model: app,
          builder: (context, model) {
            return Container(
              child: Column(
                children: __flatten([
                  Text(
                    'You have pushed:'
                  ),
                  DefaultTextStyle(
                    child: Container(
                      child: Text(
                        '${model.counter} times!'
                      ),
                      margin: EdgeInsets.only(top: (30).toDouble())
                    ),
                    style: TextStyle(
                      fontSize: (25).toDouble(),
                      color: Colors.black
                    )
                  )
                ])
              ),
              margin: EdgeInsets.only(top: (100).toDouble())
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () { app.incrementCounter(); },
        child: Icon(
          Icons.add
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