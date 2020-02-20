import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double spendingAmount;
  final double spendingPctOfTotal;
  final String label;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        FittedBox(child: Text('\$ ${spendingAmount.toStringAsFixed(0)}')),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color.fromARGB(155, 190, 196, 192),
                ),
                height: 50,
                width: 10,
              ),
              Container(
                height: 50,
                width: 10,
                child: FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: spendingPctOfTotal,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 113, 138, 166),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(label),
      ],
    );
  }
}
