import 'package:flutter/material.dart';
import './expense_item.dart';
import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDismissed});

  final List<Expense> expenses;
  final Function(Expense expense) onDismissed;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
          background: Container(
            alignment: Alignment.centerLeft,
            decoration:
                const BoxDecoration(color: Color.fromARGB(255, 98, 23, 18)),
            child: const Icon(Icons.cancel),
          ),
          key: Key(expenses[index].title),
          onDismissed: (direction) {
            onDismissed(expenses[index]);
          },
          child: ExpenseItem(expense: expenses[index])),
    );
  }
}
