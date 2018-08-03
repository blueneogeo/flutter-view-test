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

// ignore: non_constant_identifier_names
 HomePage({ AppModel model,  }) {
  final widget = MaterialApp(
    title: 'Flutter Demo!',
    home: ScopedModelDescendant<AppModel>(
      builder: (context, widget, model) {
        return Scaffold(
          appBar: AppBar(
            title: Container(
              child: Text(
                'Welcome'
              )
            )
          ),
          body: Center(
            child: Column(
              children: __flatten([
                Container(
                  child: Text(
                    'You have pushed:'
                  ),
                  margin: EdgeInsets.only(top: 100.0)
                ),
                DefaultTextStyle(
                  child: Container(
                    child: Text(
                      '${model.counter} times'
                    ),
                    margin: EdgeInsets.only(top: 30.0)
                  ),
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black
                  )
                )
              ])
            )
          ),
          floatingActionButton: FloatingActionButton(
            tooltip: 'Increment',
            onPressed: () { model.incrementCounter(); },
            child: Icon(
              Icons.add
            )
          )
        );
      }
    )
  );
  return (model != null) ?
    ScopedModel<AppModel>(model: model, child: widget) 
    : widget;
}

// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}