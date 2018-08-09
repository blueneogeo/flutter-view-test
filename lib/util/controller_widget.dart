// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter/cupertino.dart';
// ignore: unused_import
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
// ignore: unused_import
import 'package:scoped_model/scoped_model.dart';
// ignore: unused_import
import 'package:tester/app-model.dart';

typedef Widget AnimControlledBuilder(AnimationController controller, Widget child);
typedef void OnCreatedAnimationController(AnimationController controller);

class AnimController extends StatefulWidget {
  /// the amount of time in milliseconds that the controller takes to animate
  final int duration;

  /// the builder function that gets called for every tick
  final AnimControlledBuilder builder;

  /// if true, automatically start the animation
  final bool autoStart;

  /// optional listener for the creation of the controller
  final OnCreatedAnimationController onCreated;

  final Widget child;

  AnimController({
    Key key,
    @required this.duration,
    @required this.builder,
    this.child,
    this.autoStart = false,
    this.onCreated,
  }) : assert(duration != null),
       assert(builder != null),
       super(key: key);

  @override
  State<AnimController> createState() {
    return _AnimController(
      duration: Duration(milliseconds: duration),
      builder: builder,
      autoStart: autoStart,
      child: child,
      onCreated: onCreated,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(new IntProperty('duration', duration, unit: 'ms'));
  }
}

class _AnimController extends State<AnimController>
    with TickerProviderStateMixin {
  Duration duration;
  AnimControlledBuilder builder;
  bool autoStart;
  Widget child;
  OnCreatedAnimationController onCreated;

  AnimationController _controller;

  _AnimController({
    @required this.duration,
    @required this.builder,
    this.child,
    this.autoStart,
    this.onCreated,
  });

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: duration, vsync: this);
    if (onCreated != null) {
      onCreated(_controller);
    }
    if (autoStart) _controller.forward().orCancel;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, widget) {
        return this.builder(_controller, child);
      },
      child: child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// ANIMATION

class AnimationBuilder extends StatefulWidget {
  final AnimationController controller;
  final Tween<double> tween;
  final AnimationBuilderBuilder builder;

  AnimationBuilder({
    @required this.controller,
    @required this.tween,
    @required this.builder,
  });

  @override
  State<StatefulWidget> createState() {
    return _AnimationBuilderState(controller, tween, builder);
  }
}

typedef Widget AnimationBuilderBuilder(Animation<double> animation);

class _AnimationBuilderState extends State<AnimationBuilder> {
  AnimationController controller;
  Tween<double> tween;
  AnimationBuilderBuilder builder;

  _AnimationBuilderState(this.controller, this.tween, this.builder);

  @override
  Widget build(BuildContext context) {
    Animation<double> animation = tween.animate(controller);
    return builder(animation);
  }
}

double animate(AnimationController controller, { double begin = 0.0, double end = 100.0, Curve curve = Curves.linear }) {
  return Tween(begin: begin, end: end)
    .chain(CurveTween(curve: curve))
    .animate(controller)
    .value;
}
