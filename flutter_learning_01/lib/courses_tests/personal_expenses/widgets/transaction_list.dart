import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

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
                            '\$ ${transactions[index].amount.toStringAsFixed(2)}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(transactions[index].title,
                        style: Theme.of(context).textTheme.title),
                    subtitle: Text(
                      new DateFormat('yyyy.MMMM.dd hh:mm aaa')
                          .format(transactions[index].date),
                    ),
                    trailing: MediaQuery.of(context).size.width > 360
                        ? FlatButton.icon(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              removeTransaction(transactions[index].id);
                            },
                            label: Text('remove'),
                            textColor: Theme.of(context).errorColor)
                        : IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              removeTransaction(transactions[index].id);
                            },
                            color: Theme.of(context).errorColor,
                          )),
              );

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
