import 'package:flutter/material.dart';

void main() {
  runApp(MyGesturesSample());
}

class MyGesturesSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Images Gallery",
      home: new GesturesPage(),
    );
  }
}

class GesturesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyGesturesPage();
}

class _MyGesturesPage extends State<GesturesPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter test 01'),
        backgroundColor: Colors.teal,
      ),
      // body: Center(
      //   child: Text("You pressed the button $_counter times."),
      // ),
      body: new Center(
          child: new GestureDetector(
        child: RotationTransition(
          turns: curve,
          child: Image.asset('images/asp.net.core.architecture.png'),
        ),
        onDoubleTap: () {
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
      )),
    );
  }
}
