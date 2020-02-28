import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.removeTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final Function removeTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FittedBox(
                child: Text(
                  '\$ ${transaction.amount.toStringAsFixed(2)}',
                ),
              ),
            ),
          ),
          title:
              Text(transaction.title, style: Theme.of(context).textTheme.title),
          subtitle: Text(
            new DateFormat('yyyy.MMMM.dd hh:mm aaa').format(transaction.date),
          ),
          trailing: MediaQuery.of(context).size.width > 360
              ? FlatButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeTransaction(transaction.id);
                  },
                  // we can use const on Widgets which it's data don't change since compile time, not for widgets that it's data may change in Runtime.
                  label: const Text('remove'),
                  textColor: Theme.of(context).errorColor)
              : IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    removeTransaction(transaction.id);
                  },
                  color: Theme.of(context).errorColor,
                )),
    );
  }
}
