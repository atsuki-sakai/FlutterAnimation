import 'package:flutter/material.dart';

class TTweenAnimatin extends StatefulWidget {
  @override
  _TTweenAnimatinState createState() => _TTweenAnimatinState();
}

class _TTweenAnimatinState extends State<TTweenAnimatin> with SingleTickerProviderStateMixin {

  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
        duration: Duration(milliseconds: 5000), vsync: this);
    _animation = Tween(begin: 0.0, end: 400.0).animate(_controller);
    _animation.addListener(() {
      setState(() {

      });
    });
    _controller.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: _animation.value,
      width: _animation.value,
      child: Center(
        child: FlutterLogo(size: 300,),
      ),
    );
  }
}
