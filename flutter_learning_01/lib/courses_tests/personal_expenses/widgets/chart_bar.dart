import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final double spendingAmount;
  final double spendingPctOfTotal;
  final String label;

  ChartBar(this.label, this.spendingAmount, this.spendingPctOfTotal);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          children: <Widget>[
            Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(
                  child: Text('\$ ${spendingAmount.toStringAsFixed(0)}'),
                )),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(155, 190, 196, 192),
                    ),
                  ),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: spendingPctOfTotal,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 113, 138, 166),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: constraints.maxHeight * 0.05,
            ),
            Container(
                height: constraints.maxHeight * 0.15,
                child: FittedBox(child: Text(label))),
          ],
        );
      },
    );
  }
}
