import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({super.key, required this.expense});

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(expense.title),
          Text(expense.amount.toStringAsFixed(2))
        ],
      ),
    );
  }
}
