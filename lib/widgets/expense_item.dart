import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(expense.title),
              Row(
                children: [
                  Text("\$ ${expense.amount.toStringAsFixed(2)}"),
                  const Spacer(),
                  Row(
                    children: [
                      expense.categorIcon,
                      const SizedBox(
                        width: 4,
                      ),
                      Text(expense.formatedDate)
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
