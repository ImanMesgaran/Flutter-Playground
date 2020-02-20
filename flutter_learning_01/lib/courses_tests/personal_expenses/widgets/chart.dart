import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../widgets/chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double todaySum;

      todaySum = recentTransactions
          .where((x) =>
              x.date.day == weekDay.day &&
              x.date.month == weekDay.month &&
              x.date.year == weekDay.year)
          .fold(0.0, (curr, next) => curr + next.amount);

      return {'day': DateFormat.E().format(weekDay), 'amount': todaySum};
    }).reversed.toList();
  }

  double get totalSum {
    var totalSum = groupedTransactionValues.fold(
        0.0, (curr, next) => curr + next['amount']);
    print('Total sum is $totalSum');
    return totalSum;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  data['day'],
                  data['amount'],
                  totalSum == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSum),
            );
          }).toList(),
        ),
      ),
    );
  }
}
