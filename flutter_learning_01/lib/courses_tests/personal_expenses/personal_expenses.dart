import 'package:flutter/material.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
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
  List<Transaction> get _recentTransactions {
    return _userTransactions
        .where(
            (x) => x.date.isAfter(DateTime.now().subtract(Duration(days: 7))))
        .toList();
  }

  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'n1',
        title: 'New BookShelf',
        amount: 150,
        date: DateTime.now().subtract(Duration(days: 1))),
    Transaction(
        id: 'n2',
        title: 'New Shoes',
        amount: 370,
        date: DateTime.now().subtract(Duration(days: 2))),
    Transaction(
        id: 'n3',
        title: 'Dentistery',
        amount: 150,
        date: DateTime.now().subtract(Duration(days: 3))),
    Transaction(
        id: 'n4',
        title: 'Dentistery',
        amount: 500,
        date: DateTime.now().subtract(Duration(days: 4))),
    Transaction(
        id: 'n5',
        title: 'New Shoes',
        amount: 370,
        date: DateTime.now().subtract(Duration(days: 5))),
    Transaction(
        id: 'n6', title: 'Dentistery', amount: 60, date: DateTime.now()),
    Transaction(
        id: 'n7', title: 'Dentistery', amount: 600, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    // extracted AppBar, so we can get height of the appbar in the app
    var appBar = AppBar(
      title: Text('My Personal Expenses'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {
            _addNewTransactionSheet(context);
          },
        )
      ],
    );

    // calculate available content height
    var calculatedContentHeight =
        // get size of the Device height base on given context
        MediaQuery.of(context).size.height
            // get height of the AppBar
            -
            appBar.preferredSize.height
            // get height of StatusBar
            -
            MediaQuery.of(context).padding.top;

    print('padding height is ${calculatedContentHeight * 0.015}');
    return Scaffold(
      appBar: appBar,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child: Chart(_recentTransactions),
            height: calculatedContentHeight * 0.3,
          ),
          Container(
              child: TransactionList(_userTransactions, _removeTransaction),
              height: calculatedContentHeight * 0.6)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNewTransactionSheet(context);
        },
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  void _addNewTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
        id: DateTime.now().toString(),
        title: title,
        amount: amount,
        date: date);

    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _removeTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) {
        return tx.id == id;
      });
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
