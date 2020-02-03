import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyProgressNetworkApp());
}

class MyProgressNetworkApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sample App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new SampleAppPage(),
    );
  }
}

class SampleAppPage extends StatefulWidget {
  SampleAppPage({Key key}) : super(key: key);

  @override
  _SampleAppPageState createState() => new _SampleAppPageState();
}

class _SampleAppPageState extends State<SampleAppPage> {
  List widgets = [];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  showLoadingDialog() {
    return widgets.length == 0;
  }

  getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  getProgressDialog() {
    return new Center(child: new CircularProgressIndicator());
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: getBody());
  }

  ListView getListView() => new ListView.builder(
      itemCount: widgets.length,
      itemBuilder: (BuildContext context, int position) {
        return getRow(position);
      });

  Widget getRow(int i) {
    // return new Padding(
    //     padding: new EdgeInsets.all(10.0),
    //     child: new Text("Row ${widgets[i]["title"]}"));

    // return new Row(
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: <Widget>[
    //       new Text("${widgets[i]["id"]}", maxLines: 2),
    //       new Text(
    //         "${widgets[i]["title"]}",
    //         maxLines: 2,
    //       )
    //     ]);

    // return GridView.count(
    //   crossAxisCount: 2,
    //   children: <Widget>[
    //     new Text("${widgets[i]["id"]}"),
    //     new Text("${widgets[i]["title"]}"),
    //   ],
    // );

    return new ListTile(
        title: new Text("${widgets[i]["id"]}", maxLines: 2),
        subtitle: new Text(
          "${widgets[i]["title"]}",
          maxLines: 2,
        ));
  }

  loadData() async {
    String dataURL = "https://jsonplaceholder.typicode.com/posts";
    http.Response response = await http.get(dataURL);
    setState(() {
      widgets = json.decode(response.body);
    });
  }
}
