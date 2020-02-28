import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../models/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final Function removeTransaction;
  final List<Transaction> transactions;

  TransactionList(this.transactions, this.removeTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text('No transaction added yet!'),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (BuildContext ctx, int index) {
              return TransactionItem(
                  transaction: transactions[index],
                  removeTransaction: removeTransaction);

              /*
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      child: Text(
                        '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.italic,
                            fontSize: 16,
                            color: Theme.of(context).primaryColorDark),
                      ),
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).primaryColorLight,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.all(10),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(transactions[index].title,
                            style: Theme.of(context).textTheme.title),
                        Text(
                          new DateFormat('yyyy.MMMM.dd hh:mm aaa')
                              .format(transactions[index].date),
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
              */
            },
          );
  }
}
