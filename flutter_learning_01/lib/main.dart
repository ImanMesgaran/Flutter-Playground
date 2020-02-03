import 'package:flutter/material.dart';
import 'package:flutter_learning_01/main.background.thread.dart';
import 'package:flutter_learning_01/main.gestures.dart';
import 'package:flutter_learning_01/main.images.dart';
import 'package:flutter_learning_01/main.old.dart';
import 'package:flutter_learning_01/main.progress.networkcall.dart';
import 'package:flutter_learning_01/main.toggle.animation.dart';

import 'main.network.data.dart';
import 'main.signaturepad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Learning 01',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'Flutter 01 HomePage'),
      routes: <String, WidgetBuilder>{
        '/a': (BuildContext context) => new MyOldApp(),
        '/b': (BuildContext context) => new DemoApp(),
        '/c': (BuildContext context) => new MyToggleApp(),
        '/d': (BuildContext context) => new MyNetworkApp(),
        '/e': (BuildContext context) => new MyBackgroundApp(),
        '/f': (BuildContext context) => new MyProgressNetworkApp(),
        '/g': (BuildContext context) => new MyImagesSample(),
        '/h': (BuildContext context) => new MyGesturesSample()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
        child: CustomButton("Hello"),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          color: Colors.teal,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/d');
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (BuildContext context) => MyBackgroundApp(),
          //     ));
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      drawer: Drawer(
        child: Center(
          child: Text("data"),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String label;

  CustomButton(this.label);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(onPressed: () {}, child: new Text(label));
  }
}
