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
  String _fieldBText;
  String _errorText;

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
    var textField = TextField(
      maxLines: 1,
      decoration: InputDecoration(
        hintText: "Enter your username",
        labelText: "Username",
        errorText: _getErrorText(),
      ),
      controller: _fieldAController,
      onSubmitted: (text) {
        setState(() {
          if (!isEmail(text)) {
            _errorText = 'Enter valid email address';
          } else {
            _errorText = null;
          }
        });
      },
      onEditingComplete: () {},
      onChanged: (text) {
        setState(() {
          if (['', null].contains(text)) {
            _errorText = null;
            print('current text is null');
          }
          print('current text is: $text');
          print('onChanged event');
          print('onError text $_errorText');
        });
      },
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 30.0),
          child: textField,
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
              _fieldBText = text;
              print('Field B value: $_fieldBText');
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
            onPressed: () {
              // return showDialog(
              //     context: context,
              //     builder: (context) {
              //       return new AlertDialog(
              //         content: new Text(
              //             "User name is: ${_fieldAController.text} \n Password: $_fieldBText"),
              //       );
              //     });

              return showModalBottomSheet(
                  context: context,
                  builder: (context) => Material(
                      clipBehavior: Clip.antiAlias,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.only(
                              topLeft: new Radius.circular(15.0),
                              topRight: new Radius.circular(15.0))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[Text('s')],
                      )));
            },
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

  _getErrorText() {
    return _errorText;
  }

  bool isEmail(String em) {
    String emailRegexp =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(emailRegexp);

    return regExp.hasMatch(em);
  }
}
