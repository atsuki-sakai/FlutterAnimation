import 'package:flutter/material.dart';

class AAnimatedWidget extends StatefulWidget {
  @override
  _AAnimatedWidgetState createState() => _AAnimatedWidgetState();
}

class AnimatedLogo extends AnimatedWidget {
  // Tween は変化量を決めるWidget、色々なアニメーションに汎用的に使う
  static final _opacityTween = Tween<double>(begin: 0.1, end: 1.0);
  static final _sizeTween = Tween<double>(begin: 50.0, end: 300);
  static final _rotateTween = Tween<double>(begin: 0.1, end: 12.0);

  // ! AnimatedWidgetをextendsしたら,listenableにanimationを渡す
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Center(
      child: Transform.rotate(
        angle: _rotateTween.evaluate(animation),
        child: Opacity(
          opacity: _opacityTween.evaluate(animation),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10.0),
            height: _sizeTween.evaluate(animation),
            width: _sizeTween.evaluate(animation),
            child: FlutterLogo(),
          ),
        ),
      ),
    );
  }
}

class _AAnimatedWidgetState extends State<AAnimatedWidget>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setUpLogoAnimation();
  }

  void setUpLogoAnimation() {
    _controller =
        AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _animation.addStatusListener(listener);
    _controller.forward();
  }

  void listener(AnimationStatus states) {
    if (states == AnimationStatus.completed) {
      _controller.reverse();
    } else if (states == AnimationStatus.dismissed) {
      _controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedLogo(
        animation: _animation,
      ),
    );
    ;
  }
}
