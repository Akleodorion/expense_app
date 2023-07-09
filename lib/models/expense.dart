import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

var uuid = const Uuid().v4();
var formated = DateFormat.yMd();

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

  String get formatedDate {
    return formated.format(date);
  }

  Widget get categorIcon {
    final Widget categoryIcon;

    if (category == Category.food) {
      categoryIcon = const Icon(Icons.dining);
    } else if (category == Category.leisure) {
      categoryIcon = const Icon(Icons.sports_baseball_sharp);
    } else if (category == Category.work) {
      categoryIcon = const Icon(Icons.work);
    } else {
      categoryIcon = const Icon(Icons.airplane_ticket);
    }

    return categoryIcon;
  }
}
