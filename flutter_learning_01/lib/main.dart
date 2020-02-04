import 'package:flutter/material.dart';
import 'package:flutter_learning_01/main.background.thread.dart';
import 'package:flutter_learning_01/main.gestures.dart';
import 'package:flutter_learning_01/main.images.dart';
import 'package:flutter_learning_01/main.old.dart';
import 'package:flutter_learning_01/main.progress.networkcall.dart';
import 'package:flutter_learning_01/main.toggle.animation.dart';
import 'package:flutter_learning_01/pages/custom.entry.dart';
import 'package:flutter_learning_01/pages/custom.fonts.dart';

import 'main.network.data.dart';
import 'main.signaturepad.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var namedRoutes = <String, WidgetBuilder>{
      'MyOldApp': (BuildContext context) => new MyOldApp(),
      'DemoApp': (BuildContext context) => new DemoApp(),
      'MyToggleApp': (BuildContext context) => new MyToggleApp(),
      'MyNetworkApp': (BuildContext context) => new MyNetworkApp(),
      'MyBackgroundApp': (BuildContext context) => new MyBackgroundApp(),
      'MyProgressNetworkApp': (BuildContext context) =>
          new MyProgressNetworkApp(),
      'MyImagesSample': (BuildContext context) => new MyImagesSample(),
      'MyGesturesSample': (BuildContext context) => new MyGesturesSample(),
      'MyCustomFontsSample': (BuildContext context) =>
          new MyCustomFontsSample(),
      'MyCustomEntrySample': (BuildContext context) => new MyCustomEntrySample()
    };

    return new MaterialApp(
      debugShowMaterialGrid: false,
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'My Flutter PlayGround', routes: namedRoutes),
      routes: namedRoutes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  final Map<String, WidgetBuilder> routes;

  MyHomePage({Key key, this.title, this.routes}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.deepOrange,
      ),
      // body: Center(
      //   child: Text("You pressed the button $_counter times."),
      // ),
      body: new Center(
          // child: CustomButton("Hello"),
          child: getPages()),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          color: Colors.deepOrangeAccent,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      drawer: Drawer(
        child: Center(
          child: Text("data"),
        ),
      ),
    );
  }

  ListView getPages() {
    List<String> routesName = widget.routes.keys.toList();
    return ListView.builder(
        itemCount: routesName.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('${routesName[index]}'),
            onTap: () async {
              await Navigator.of(context).pushNamed('${routesName[index]}');
            },
          );
          // return ListTile(
          //     title: Text('${ModalRoute.of(context).settings.arguments}'));
        });
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
