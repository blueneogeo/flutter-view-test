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
import 'package:tester/util/reactive-model.dart';

// ignore: non_constant_identifier_names
MaterialApp AnimationsPage({ model }) {
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
        child: ReactiveModel(
          model: model,
          builder: (context, model) {
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
}
// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}