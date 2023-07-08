import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [Text('Hello'), Text('List to be added')],
    );
  }
}
