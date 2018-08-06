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

typedef Widget AnimationControlledBuilder(AnimationController controller);

class Control extends StatefulWidget {
  final Duration duration;
  final AnimationControlledBuilder builder;
  final bool autoStart;

  Control({@required this.duration, @required this.builder, this.autoStart = false});

  @override
  State<Control> createState() {
    return _ControlState(duration: duration, builder: builder, autoStart: autoStart);
  }
}

class _ControlState extends State<Control> with SingleTickerProviderStateMixin {
  final Duration duration;
  final AnimationControlledBuilder builder;
  final bool autoStart;
  
  AnimationController _controller;

  _ControlState({@required this.duration, @required this.builder, this.autoStart});

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: duration, vsync: this);
    if(autoStart) _controller.forward();
    print('created controller $_controller');
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, widget) {
        return this.builder(_controller);
      },
    );
  }
}
