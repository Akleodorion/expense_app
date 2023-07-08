import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../widgets/expenses_list.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Burger King',
        amount: 19.80,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        title: 'Dunkerque',
        amount: 46.45,
        date: DateTime(2023, 5, 26),
        category: Category.travel)
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Hello'),
        ExpensesList(
          expenses: _registeredExpenses,
        )
      ],
    );
  }
}
