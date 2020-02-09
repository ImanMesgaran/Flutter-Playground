import 'package:flutter/material.dart';

void main() {
  runApp(MyListViewSample());
}

class MyListViewSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Simple ListView',
      home: new SimpleListViewPage(),
    );
  }
}

class SimpleListViewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyListViewSample();
}

class _MyListViewSample extends State<SimpleListViewPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Simple ListView'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: ListView.builder(itemBuilder: (context, i) {
          // if (i.isOdd) return new Divider();
          // // rest of function
          // return ListTile(
          //   title: Text('$i'),
          // );

          return Column(
            children: <Widget>[
              Container(
                child: ListTile(title: Text('$i')),
                color: Colors.teal[50],
              ),
              Divider(
                height: 1,
                color: Colors.grey,
              ),
              Container(
                child: CheckboxListTile(
                  title: Text('Requirement:'),
                  onChanged: (value) {},
                  value: true,
                ),
              )
            ],
          );
        }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              onPressed: () {
                print('Button a clicked!');
              },
              heroTag: null,
              child: Icon(Icons.add),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: FloatingActionButton(
              child: Icon(Icons.add_a_photo),
              onPressed: () {
                print('Button B clicked!');
              },
            ),
          )
        ],
        mainAxisAlignment: MainAxisAlignment.end,
      ),
    );
  }
}
