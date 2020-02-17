import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';

void main() {
  runApp(MyPersonalExpensesApp());
}

class MyPersonalExpensesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses',
      home: MyPersonalExpensesPage(),
      // themeMode: ThemeMode.dark,
      theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.amber,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 16)),
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: 20)))),
    );
  }
}

class MyPersonalExpensesPage extends StatefulWidget {
  @override
  _MyPersonalExpensesPageState createState() => _MyPersonalExpensesPageState();
}

class _MyPersonalExpensesPageState extends State<MyPersonalExpensesPage> {
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 'n1', title: 'New BookShelf', amount: 150, date: DateTime.now()),
    // Transaction(
    //     id: 'n1', title: 'New Shoes', amount: 370, date: DateTime.now()),
    // Transaction(
    //     id: 'n1', title: 'Dentistery', amount: 600, date: DateTime.now()),
    // Transaction(
    //     id: 'n1', title: 'Dentistery', amount: 600, date: DateTime.now()),
    // Transaction(
    //     id: 'n1', title: 'New Shoes', amount: 370, date: DateTime.now()),
    // Transaction(
    //     id: 'n1', title: 'Dentistery', amount: 600, date: DateTime.now()),
    // Transaction(
    //     id: 'n1', title: 'Dentistery', amount: 600, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Personal Expenses'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              print('Menu item clicked!');
              _addNewTransactionSheet(context);
            },
            // color: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
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
            // UserTransactions()
            TransactionList(_userTransactions)
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating action button clicked!');
          _addNewTransactionSheet(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _addNewTransaction(String title, double amount) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: DateTime.now());

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _addNewTransactionSheet(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (wCtx) {
          return NewTransaction(_addNewTransaction);
        });
  }
}
