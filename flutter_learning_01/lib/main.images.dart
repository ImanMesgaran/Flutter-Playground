import 'package:flutter/material.dart';

void main() {
  runApp(MyImagesSample());
}

class MyImagesSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Images Gallery",
      home: new ImagesPage(),
    );
  }
}

class ImagesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyImagesPage();
}

class _MyImagesPage extends State<ImagesPage>
    with WidgetsBindingObserver, TickerProviderStateMixin {
  AppLifecycleState _appLifecycleState;

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
        child: Image.asset('images/asp.net.core.architecture.png'),
      ),
    );
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appLifecycleState) {
    setState(() {
      _appLifecycleState = appLifecycleState;
    });
    print("this is the current App LifeCycle : $appLifecycleState");
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }
}
