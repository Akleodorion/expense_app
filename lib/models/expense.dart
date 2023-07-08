import 'package:uuid/uuid.dart';

var uuid = const Uuid().v4();

enum Category { food, leisure, work, travel }

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid;

  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  final String id;
}
