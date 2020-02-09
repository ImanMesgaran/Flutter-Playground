import 'package:flutter/material.dart';

void main() {
  runApp(MyGestures());
}

class MyGestures extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Gestures',
      home: new GesturesSamplePage(),
    );
  }
}

class GesturesSamplePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _GesturesSamplePage();
}

class _GesturesSamplePage extends State<GesturesSamplePage> {
  Offset _offset;
  //creating Key for red panel
  GlobalKey _keyRed = GlobalKey();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  _afterLayout(_) {
    //_getSizes();
    _getPositions();
  }

  _getPositions() {
    final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    _offset = renderBoxRed.localToGlobal(Offset.zero);
    print("POSITION of Red: $_offset ");
  }

  // tutorial and error message handling:
  // https://medium.com/@diegoveloper/flutter-widget-size-and-position-b0a9ffed9407

  @override
  Widget build(BuildContext context) {
    //final RenderBox renderBoxRed = _keyRed.currentContext.findRenderObject();
    //_offset = renderBoxRed.localToGlobal(Offset.zero);

    // R
    return new Scaffold(
      appBar: AppBar(
        title: Text('Simple ListView'),
        backgroundColor: Colors.teal,
      ),
      body: Transform.translate(
        offset: _offset,
        child: Center(
          child: GestureDetector(
            child: Text(
              'Simple Gesture',
              key: _keyRed,
            ),
            onVerticalDragUpdate: (dragDetails) async {
              var x = dragDetails.globalPosition.dy;
              print(x);
              print('drag updated');
              setState(() {
                _offset = dragDetails.globalPosition;
              });
            },
            onVerticalDragStart: (details) {
              print('drag started');
            },
          ),
        ),
      ),
    );
  }
}
