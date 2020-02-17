import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No transaction added yet!'),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (BuildContext context, int index) {
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
                            // borderRadius: BorderRadius.all(Radius.circular(10))),
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
              },
              itemCount: transactions.length,
            ),
    );
  }
}
