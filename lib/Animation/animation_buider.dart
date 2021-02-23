import 'package:flutter/material.dart';

class AAnimationBuilder extends StatefulWidget {
  @override
  _AAnimationBuilderState createState() => _AAnimationBuilderState();
}

class _AAnimationBuilderState extends State<AAnimationBuilder>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        duration: Duration(
          milliseconds: 10000,
        ),
        vsync: this);
    final CurvedAnimation curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _animation = Tween(begin: 70.0, end: 300.0).animate(curve);
    //* .forward()でanimationがスタートする。
    _controller.forward();
  }

  Widget builder(BuildContext context, Widget child) {
    return Container(
      height: _animation.value,
      width: _animation.value,
      child: FlutterLogo(
        size: 300,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: builder,
        ),
      ),
    );
  }
}
