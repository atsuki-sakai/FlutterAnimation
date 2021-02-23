import 'package:flutter/material.dart';
import 'package:flutter_animation/Animation/animation_buider.dart';
import 'package:flutter_animation/Animation/tween_animation.dart';

void main() {
  runApp(Base(child: AAnimationBuilder()));
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
