import 'package:flutter/material.dart';

void main() => runApp(new MyOldApp());

class MyOldApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // debugShowMaterialGrid: true,
      // showSemanticsDebugger: true,
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text("Splash Screen Example"),
        ),
        body: Center(
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
