import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/screens/account.dart';
import 'package:flutter_test_app/screens/settings.dart';

class HomeScreen extends StatefulWidget {
  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Drawer getNavDrawer(BuildContext context) {
    var headerChild = DrawerHeader(
        child:
            //Container(
            //       child: Column(
            // children: <Widget>[
            //   // Load image from network
            //   Image.network(
            //       'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/flutter_logo.png'),
            //   // even loads gifs
            //   // Gif image from Giphy, all copyrights are owned by Giphy
            //   Image.network(
            //       'https://github.com/nisrulz/flutter-examples/raw/develop/image_from_network/img/loop_anim.gif'),
            // ],))

            GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        new GestureDetector(
            onTap: () {
              setState(() {
                // pop closes the drawer
                Navigator.of(context).pop();
                // navigate to the route
                Navigator.of(context).pushNamed("/account");
              });
            },
            child: Container(
                decoration: new BoxDecoration(
              shape: BoxShape.circle,
              image: new DecorationImage(
                  fit: BoxFit.fill,
                  image: new NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLQ2UUCqkWiywWmFft8erAGvNWEG-x45T7czI9QkRzodENRqcG&s',
                  )),
            ))),
        Container(
          padding: const EdgeInsets.all(8),
          child: const Text('He\'d have you all unravel at the'),
          color: Colors.teal[400],
        ),
      ],
    )

        //   child: new Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // children: <Widget>[
        //   new Text("Header"),
        //   new Icon(Icons.accessible),
        // ],
        );

    var aboutChild = AboutListTile(
        child: Text("About"),
        applicationName: "Application Name",
        applicationVersion: "v1.0.0",
        applicationIcon: Icon(Icons.adb),
        icon: Icon(Icons.info));

    ListTile getNavItem(var icon, String s, String routeName) {
      return ListTile(
        leading: Icon(icon),
        title: Text(s),
        onTap: () {
          setState(() {
            // pop closes the drawer
            Navigator.of(context).pop();
            // navigate to the route
            Navigator.of(context).pushNamed(routeName);
          });
        },
      );
    }

    var myNavChildren = [
      headerChild,
      getNavItem(Icons.settings, "Settings", SettingsScreen.routeName),
      getNavItem(Icons.home, "Home", "/"),
      getNavItem(Icons.account_box, "Account", AccountScreen.routeName),
      aboutChild,
      new Stack(
        children: <Widget>[
          new Icon(Icons.add_box,
              size: 24.0, color: const Color.fromRGBO(0, 0, 0, 1.0)),
          new Positioned(
            left: 10.0,
            child: new Icon(Icons.add_circle,
                size: 24.0, color: const Color.fromRGBO(0, 0, 0, 1.0)),
          ),
        ],
      ),
    ];

    ListView listView = ListView(children: myNavChildren);

    return Drawer(
      child: listView,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Navigation Drawer Example"),
      ),
      body: Container(
          child: Center(
        child: Text("Home Screen"),
      )),
      // Set the nav drawer
      drawer: getNavDrawer(context),
    );
  }
}
