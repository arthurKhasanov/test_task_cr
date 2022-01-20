import 'package:flutter/material.dart';
import 'package:test_tusk_cr/db/database.dart';
import 'package:test_tusk_cr/ui/widgets/task_card.dart';

class TaskList extends StatelessWidget {
  final List<Task> taskList;
  const TaskList({Key? key, required this.taskList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final task = taskList[index];
        return TaskCard(
          task: task,
        );
      },
      itemCount: taskList.length,
      separatorBuilder: (BuildContext context, int index) => const SizedBox()
    );
  }
}