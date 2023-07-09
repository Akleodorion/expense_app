import 'package:flutter/material.dart';
import '../models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleInputController = TextEditingController();
  final _amountInputController = TextEditingController();

  Category _selectedCategory = Category.leisure;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleInputController.dispose();
    _amountInputController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final DateTime date = DateTime.now();
    DateTime? value = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(date.year - 1, date.month, date.day),
        lastDate: date);

    setState(() {
      _selectedDate = value;
    });
  }

  void _saveExpense() {
    final amount = double.tryParse(_amountInputController.text);
    final String title = _titleInputController.text;

    final amountInvalid = amount == null || amount <= 0;

    if (title.trim().isEmpty || amountInvalid || _selectedDate == null) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('invalid Info'),
                content: const Text('make sure that the info are valid'),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('close'))
                ],
              ));
      return;
    }

    var newExpense = Expense(
        title: title,
        amount: amount,
        date: _selectedDate!,
        category: _selectedCategory);

    widget.onAddExpense(newExpense);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
      child: Column(
        children: [
          TextField(
            controller: _titleInputController,
            decoration: const InputDecoration(label: Text('Title')),
            keyboardType: TextInputType.name,
            maxLength: 50,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountInputController,
                  decoration: const InputDecoration(label: Text('Amount')),
                  keyboardType: TextInputType.number,
                ),
              ),
              Row(
                children: [
                  _selectedDate == null
                      ? const Text('Pick a date')
                      : Text(formated.format(_selectedDate!)),
                  IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month))
                ],
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                items: Category.values
                    .map((category) => DropdownMenuItem(
                          value: category,
                          child: Text(category.name),
                        ))
                    .toList(),
                value: _selectedCategory,
                onChanged: (value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Quit')),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple.shade100),
                      onPressed: _saveExpense,
                      child: const Text('Save Expense'))
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
