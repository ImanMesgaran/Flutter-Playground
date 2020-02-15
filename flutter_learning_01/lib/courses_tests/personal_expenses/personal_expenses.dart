import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'models/transaction.dart';

void main() {
  runApp(MyPersonalExpensesApp());
}

class MyPersonalExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      home: MyPersonalExpensesPage(),
    );
  }
}

class MyPersonalExpensesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyPersonalExpensesPage();
}

class _MyPersonalExpensesPage extends State<MyPersonalExpensesPage> {
  final List<Transaction> transactions = [
    Transaction(
        id: 'n1', title: 'New BookShelf', amount: 150, date: DateTime.now()),
    Transaction(
        id: 'n1', title: 'New Shoes', amount: 370, date: DateTime.now()),
    Transaction(
        id: 'n1', title: 'Dentistery', amount: 600, date: DateTime.now()),
    Transaction(
        id: 'n1', title: 'Dentistery', amount: 600, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Personal Expenses'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 45,
            width: double.infinity,
            child: Card(
              elevation: 15,
              color: Colors.orange,
              child: Text(
                'home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Card(
            elevation: 10,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: 'Title:'),
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: 'Amount:'),
                  ),
                  FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Add item',
                        style: TextStyle(color: Colors.purple),
                      ))
                ],
              ),
            ),
          ),
          Column(
            children: transactions.map((t) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '\$ ${t.amount}',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            color: Colors.deepPurple),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.deepPurple,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          t.title,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          new DateFormat('yyyy.MMMM.dd hh:mm aaa')
                              .format(t.date),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontWeight: FontWeight.w300),
                        ),
                      ],
                    )
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
