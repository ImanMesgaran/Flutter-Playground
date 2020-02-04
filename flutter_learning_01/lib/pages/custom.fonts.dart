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
      body: getFontsOnWeight(),
    );
  }

  ListView getFontsOnWeight() {
    return ListView(
      children: <Widget>[
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Center(
                child: Text('Default font',
                    style: new TextStyle(
                      fontFamily: 'OpenSans',
                    ))),
          ),
          color: Colors.pink[50],
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Center(
                child: Text(
              'Light font',
              style: new TextStyle(
                  fontFamily: 'OpenSans', fontWeight: FontWeight.w300),
            )),
          ),
          color: Colors.pink[100],
        ),
        Container(
          child: new Center(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Italic font',
              style: new TextStyle(
                  fontFamily: 'OpenSans', fontStyle: FontStyle.italic),
            ),
          )),
          color: Colors.pink[200],
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Light Italic font',
                style: new TextStyle(
                    fontFamily: 'OpenSans',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w300),
              ),
            ),
          ),
          color: Colors.pink[300],
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Semi Bold font',
                style: new TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.w600),
              ),
            ),
          ),
          color: Colors.pink[400],
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Semi Bold Italic font',
                style: new TextStyle(
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                    fontStyle: FontStyle.italic),
              ),
            ),
          ),
          color: Colors.pink,
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Bold font',
                style: new TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.w700),
              ),
            ),
          ),
          color: Colors.pink[600],
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Bold Italic font',
                style: new TextStyle(
                    fontFamily: 'OpenSans',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          color: Colors.pink[700],
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Extra Bold font',
                style: new TextStyle(
                    fontFamily: 'OpenSans', fontWeight: FontWeight.w800),
              ),
            ),
          ),
          color: Colors.pink[800],
        ),
        Container(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Extra Bold Italic font',
                style: new TextStyle(
                    fontFamily: 'OpenSans',
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w800),
              ),
            ),
          ),
          color: Colors.pink[900],
        ),
      ],
    );
  }
}
