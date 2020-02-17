import 'package:flutter/material.dart';
import '../models/transaction.dart';
import './new_transaction.dart';
import './transaction_list.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 'n1', title: 'New BookShelf', amount: 150, date: DateTime.now()),
    Transaction(
        id: 'n1', title: 'New Shoes', amount: 370, date: DateTime.now()),
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

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(_addNewTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}
