import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:scoped_model/scoped_model.dart';

typedef WidgetModelBuilder(BuildContext context, dynamic model);

class Reactive extends StatelessWidget {

  Reactive({ @required this.model, @required this.builder }) : this.stream = _buildModelStream(model);
    
  final Model model;
  final WidgetModelBuilder builder;
  final Stream<dynamic> stream;
  
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: model,
      stream: this.stream,
      builder: (BuildContext context, AsyncSnapshot snap) {
        return snap.hasData ? this.builder(context, snap.data) : Container();
      },
    );
  }

  static Stream<dynamic> _buildModelStream(Model model) {
    final controller = StreamController();
    final onModelUpdate = () => controller.add(model);
    model.addListener(onModelUpdate);
    controller.onCancel = () {
      model.removeListener(onModelUpdate);
      controller.close();
    };
    return controller.stream;
  }

}
