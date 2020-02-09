import 'package:flutter/material.dart';

void main() {
  runApp(MyTest01());
}

class MyTest01 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gestures',
      home: new TestsSamplePage(),
    );
  }
}

class TestsSamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestsSamplePage();
}

class _TestsSamplePage extends State<TestsSamplePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Simple ListView'),
        backgroundColor: Colors.teal,
      ),
      body: Theme.of(context).platform == TargetPlatform.android
          ? {RaisedButton(onPressed: () {})}
          : {},
    );
  }
}
