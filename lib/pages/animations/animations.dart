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
 AnimationsPage({ AppModel model,  }) {
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
                  duration: Duration(milliseconds: 100),
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
                  crossFadeState: model.getFadeState(),
                  duration: Duration(seconds: 1),
                  firstChild: Text(
                    'Hello!'
                  ),
                  secondChild: Text(
                    'Hello Again!'
                  )
                ),
                DefaultTextStyle(
                  child: AnimatedContainer(
                    curve: Curves.easeIn,
                    duration: Duration(seconds: 1),
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
                AnimatedModelController<SomeAnimationModel>(
                  duration: Duration(seconds: 1),
                  modelFn: model.createHeightAnimModel,
                  builder: (context, widget, anim) {
                    return Column(
                      children: __flatten([
                        PlatformButton(
                          onPressed: () { anim.controller.forward(); },
                          child: Text(
                            'forward'
                          )
                        ),
                        PlatformButton(
                          onPressed: () { anim.controller.reverse(); },
                          child: Text(
                            'reverse'
                          )
                        ),
                        Container(
                          child: Text(
                            'Current controller value2: ${anim.height.value}'
                          ),
                          margin: EdgeInsets.only(top: (anim.height.value).toDouble())
                        )
                      ])
                    );
                  }
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