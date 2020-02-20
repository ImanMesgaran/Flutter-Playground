import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyPersonalExpensesApp());

class MyPersonalExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // for setting status bar color
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: Colors.white,
    // ));

    // for hiding status bar
    SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 77, 112, 166),

        // textTheme:
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color themeColor = Color.fromARGB(255, 241, 243, 246);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 241, 243, 246),
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //     gradient: LinearGradient(
          //         begin: Alignment.topCenter,
          //         end: Alignment.bottomCenter,
          //         colors: [Color.fromARGB(220, 238, 238, 238), Colors.white])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(10, 25, 0, 0),
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 30,
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 0, 10, 0),
                      child: RaisedButton(
                        padding: EdgeInsets.all(5),
                        color: Color.fromARGB(255, 241, 243, 246),
                        child: Text('f',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {},
                        elevation: 15,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 25, 0),
                      child: RaisedButton(
                        padding: EdgeInsets.all(5),
                        color: Color.fromARGB(255, 241, 243, 246),
                        child: Text('g',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Theme.of(context).primaryColor)),
                        onPressed: () {},
                        elevation: 15,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          decorationColor: Theme.of(context).primaryColor)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: TextField(
                  decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                          decorationColor: Theme.of(context).primaryColor)),
                ),
              ),
              CupertinoSwitch(value: true, onChanged: null)
            ],
          ),
        ),
      ),
    );
  }
}
