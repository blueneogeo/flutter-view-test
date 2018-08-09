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

// ignore: non_constant_identifier_names
 HomePage({ AppModel model,  }) {
  final widget = MaterialApp(
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
        child: ScopedModelDescendant<AppModel>(
          builder: (context, widget, model) {
            return Column(
              children: __flatten([
                AnimatedSwitcher(
                  duration: Duration(milliseconds:100),
                  child: Container(
                    key: ValueKey(model.counter),
                    child: Column(
                      children: __flatten([
                        Container(
                          child: Text(
                            'You have pushed:'
                          ),
                          margin: EdgeInsets.only(top: (100).toDouble())
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
                    )
                  )
                ),
                AnimatedCrossFade(
                  duration: Duration(seconds:1),
                  crossFadeState: model.getFadeState(),
                  firstChild: Text(
                    'Hello!'
                  ),
                  secondChild: Text(
                    'Hello Again!'
                  )
                ),
                DefaultTextStyle(
                  child: AnimatedContainer(
                    duration: Duration(seconds:1),
                    curve: Curves.easeIn,
                    child: Column(
                      children: __flatten([
                        Text(
                          'Just some text here'
                        )
                      ])
                    ),
                    margin: EdgeInsets.only(top: (model.counter*10).toDouble())
                  ),
                  style: TextStyle(
                    color: Colors.black
                  )
                ),
                AnimController(
                  duration: 1000,
                  onCreated: model.onAnimCreated,
                  builder: (controller, child) {
                    return Column(
                      children: __flatten([
                        Container(
                          child: Text(
                            'animated: ${animate(controller, begin:1.0, end:10.0, curve: Curves.ease)}'
                          ),
                          margin: EdgeInsets.only(top: (50).toDouble())
                        ),
                        Container()
                      ])
                    );
                  },
                  child: true ?
                    // ignore: dead_code
                    Text(
                      'This part is not animated'
                    )
                  // ignore: dead_code
                  : Container()
                )
              ])
            );
          }
        )
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        onPressed: () { model.incrementCounter(); },
        child: Icon(
          Icons.add
        )
      )
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