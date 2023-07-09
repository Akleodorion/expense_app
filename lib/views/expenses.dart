import 'package:flutter/material.dart';
import '../models/expense.dart';
import '../widgets/expenses_list.dart';
import '../views/new_expense.dart';

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

  void addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });

    Navigator.pop(context);
  }

  void _showNewExpenseModal() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return NewExpense(
            onAddExpense: addExpense,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My title'),
        actions: [
          IconButton(
            onPressed: _showNewExpenseModal,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('Hello'),
          Expanded(
            child: ExpensesList(
              expenses: _registeredExpenses,
            ),
          ),
        ],
      ),
    );
  }
}
