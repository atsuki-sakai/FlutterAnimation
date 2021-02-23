import 'package:flutter/material.dart';
import 'package:flutter_animation/Animation/animated_widget.dart';
import 'package:flutter_animation/Animation/animation_buider.dart';
import 'package:flutter_animation/Animation/listener.dart';
import 'package:flutter_animation/Animation/tween_animation.dart';

void main() {
  runApp(Base(child: AAnimatedWidget()));
}

class Base extends StatelessWidget {
  Base({@required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
  }
}
