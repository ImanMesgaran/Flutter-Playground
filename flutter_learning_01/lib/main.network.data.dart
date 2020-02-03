import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MyNetworkApp());
}

class MyNetworkApp extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Sample App"),
        ),
        body: new ListView.builder(
            itemCount: widgets.length,
            itemBuilder: (BuildContext context, int position) {
              return getRow(position);
            }));
  }

  Widget getRow(int i) {
    return new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new Text("Row ${widgets[i]["title"]}"));
  }

  loadData() async {
    //String dataURL = "https://jsonplaceholder.typicode.com/posts";
    String dataURL = "http://dev.bliksundsecure.no/v2/app/organizations";
    http.Response response = await http.get(dataURL);
    // print(response);
    setState(() {
      Map<String, dynamic> re = json.decode(response.body);
      List<dynamic> data = re["data"];
      var orgs = data
          .map((dynamic item) => {
                Organization.fromMap(item),
                print(
                    '***************** $Organization.fromMap(item) ***************')
              })
          .toList();
      widgets = orgs;
    });
  }
}

// To parse this JSON data, do
//
//     final organization = organizationFromJson(jsonString);

Organization organizationFromJson(String str) =>
    Organization.fromMap(json.decode(str));

String organizationToJson(Organization data) => json.encode(data.toMap());

class Organization {
  dynamic total;
  dynamic pageSize;
  dynamic nextPageUrl;
  dynamic updateUrl;
  List<Datum> data;

  Organization({
    this.total,
    this.pageSize,
    this.nextPageUrl,
    this.updateUrl,
    this.data,
  });

  factory Organization.fromMap(Map<String, dynamic> json) => Organization(
        total: json["total"],
        pageSize: json["page_size"],
        nextPageUrl: json["next_page_url"],
        updateUrl: json["update_url"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "page_size": pageSize,
        "next_page_url": nextPageUrl,
        "update_url": updateUrl,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  String orgId;
  String name;

  Datum({
    this.orgId,
    this.name,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        orgId: json["org_id"],
        name: json["name"],
      );

  Map<String, dynamic> toMap() => {
        "org_id": orgId,
        "name": name,
      };
}
