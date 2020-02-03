import 'package:flutter/material.dart';

void main() {
  runApp(MyCustomFontsSample());
}

class MyCustomFontsSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Images Gallery",
      home: new CustomFontsPage(),
    );
  }
}

class CustomFontsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCustomFontsPage();
}

class _MyCustomFontsPage extends State<CustomFontsPage> {
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
          child: Text(
        'this is a custom font.',
        style: new TextStyle(
            fontFamily: 'OpenSans',
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      )),
    );
  }
}
