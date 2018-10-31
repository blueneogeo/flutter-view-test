// ignore: unused_import
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:tester/util/reactive-widget.dart';
// ignore: unused_import
import 'home-model.dart';
// ignore: non_constant_identifier_names
Scaffold HomePage({ @required HomePageModel model }) {
  return Scaffold( // project://lib/pages/home/home.pug#5,2
    appBar: AppBar( // project://lib/pages/home/home.pug#6,3
      title: 
      //-- TITLE ----------------------------------------------------------
      Container( // project://lib/pages/home/home.pug#7,4
        child: Text( 
          'Welcome',
        ),
      ),
    ),
    body: Center( // project://lib/pages/home/home.pug#9,3
      child: ReactiveWidget( // project://lib/pages/home/home.pug#10,4
        watch: model as Listenable,
        builder: (context, $) {
          return 
          //-- MESSAGE ----------------------------------------------------------
          Container( // project://lib/pages/home/home.pug#11,5
            child: Column( 
              children: __flatten([
                Text( 
                  'You have pushed:',
                ),
                DefaultTextStyle.merge( 
                  child: 
                  //-- COUNTER ----------------------------------------------------------
                  Container( // project://lib/pages/home/home.pug#12,6
                    child: Text( 
                      '${model.counter} times',
                    ),
                    margin: EdgeInsets.only(top: 30),
                  ),
                  style: TextStyle( 
                    fontSize: 25,
                  ),
                )
              ]),
            ),
            margin: EdgeInsets.only(top: 100),
          );
        },
      ),
    ),
    floatingActionButton: FloatingActionButton( // project://lib/pages/home/home.pug#14,3
      onPressed: () { model.incrementCounter(); },
      child: Icon( // project://lib/pages/home/home.pug#17,4
        Icons.add,
      ),
    ),
  );
}
// ignore: unused_element
__flatten(List list) {
  return List<Widget>.from(list.expand((item) {
    return item is Iterable ? item : [item as Widget];
  }));
}