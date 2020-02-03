import 'package:flutter/material.dart';

void main() {
  runApp(new MyToggleApp());
}

class MyToggleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowMaterialGrid: false,
      title: 'Flutter Learning 01',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MyHomePage(title: 'Flutter 01 HomePage'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int _counter = 0;
  bool toggle = true;

  AnimationController controller;
  CurvedAnimation curve;

  @override
  void initState() {
    controller = new AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    curve = new CurvedAnimation(parent: controller, curve: Curves.easeOut);
  }

  ListView getListView() {
    final childs = <Widget>[];

    for (var i = 0; i < 5; i++) {
      childs.add(new ListTile(
        contentPadding: EdgeInsets.only(left: 30.0, right: 10.0),
        title: Text("$_counter"),
      ));
    }

    return ListView(children: childs);
  }

  _getToggleChilds() {
    Widget child;

    if (toggle)
      child = getListView();
    else
      child = Center(
        child: Text("not Toggled."),
      );

    // return new Container(
    //     child: new FadeTransition(opacity: curve, child: child));
    return new Container(child: child);
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
      body: _getToggleChilds(),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
          color: Colors.teal,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _counter++;
          _toggled();
        }),
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

  void _toggled() {
    setState(() {
      toggle = !toggle;
    });
  }
}
