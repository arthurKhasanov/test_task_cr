import 'package:flutter/material.dart';

class EmptyTaskList extends StatelessWidget {
  const EmptyTaskList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text('Task list is empty. Press "+" to add Task'));
  }
}