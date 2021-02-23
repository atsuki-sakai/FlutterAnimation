import 'package:flutter/material.dart';

class LListener extends StatefulWidget {
  @override
  _LListenerState createState() => _LListenerState();
}

class _LListenerState extends State<LListener>
    with SingleTickerProviderStateMixin {
  Animation _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);
    final CurvedAnimation _curve =
        CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
    _animation = Tween(begin: 100.0, end: 300.0).animate(_curve);
    _animation.addStatusListener(listener);
    // _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  void listener(AnimationStatus status) {}

  Widget builder(BuildContext context, Widget child) {
    return Container(
      height: _animation.value,
      width: _animation.value,
      child: FlutterLogo(
        size: 200,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Listener.',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            AnimatedBuilder(animation: _animation, builder: builder),
            ElevatedButton(
                onPressed: () {
                  _controller.forward();
                },
                child: Text('Button')),
          ],
        ),
      ),
    );
  }
}
