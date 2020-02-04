// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

void main() {
  runApp(MyCustomEntrySample());
}

class MyCustomEntrySample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "My Custom Entry",
      home: new CustomEntrysPage(),
    );
  }
}

class CustomEntrysPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyCustomEntryPage();
}

class _MyCustomEntryPage extends State<CustomEntrysPage> {
  TextEditingController _fieldAController;

  @override
  void initState() {
    super.initState();

    _fieldAController = new TextEditingController();

    _fieldAController.addListener(() {
      print("First text field: ${_fieldAController.text}");
    });
  }

  @override
  void dispose() {
    _fieldAController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: AppBar(
          title: Text('Custom Entry with controller'),
          backgroundColor: Colors.teal,
        ),
        body: Center(
          child: formBody(),
        ));
  }

  formBody() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[formHeader(), formFields()],
      ),
    );
  }

  formHeader() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlutterLogo(
          colors: Colors.green,
          size: 80,
        ),
        SizedBox(
          height: 30,
        ),
        Text(
          'Custom entries with TextEditingController',
          style: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w700,
              color: Colors.green),
        ),
        SizedBox(height: 10)
      ],
    );
  }

  formFields() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Enter your username",
              labelText: "Username",
            ),
            controller: _fieldAController,
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          child: TextField(
            maxLines: 1,
            obscureText: true,
            decoration: InputDecoration(
              hintText: "Enter your password",
              labelText: "Password",
            ),
            onChanged: (text) {
              print('Field B Edited.');
            },
          ),
        ),
        SizedBox(
          height: 30.0,
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 30.0),
          width: double.infinity,
          child: RaisedButton(
            padding: EdgeInsets.all(12.0),
            shape: StadiumBorder(),
            child: Text(
              "SIGN IN",
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.green,
            onPressed: () {},
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          "SIGN UP FOR AN ACCOUNT",
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
