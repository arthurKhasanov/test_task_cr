import 'package:flutter/material.dart';

class FailureTaskList extends StatelessWidget {
  final Exception exception;
  const FailureTaskList({Key? key, required this.exception}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(exception.toString()),
    );
  }
}