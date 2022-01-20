import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tusk_cr/bloc/task_cubit.dart';
import 'package:test_tusk_cr/db/database.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  const TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor: const Color.fromRGBO(87, 87, 103, 1),
          side: MediaQuery.of(context).platformBrightness == Brightness.dark
              ? const BorderSide(
                  width: 2,
                  color: Color.fromRGBO(14, 14, 17, 1),
                )
              : const BorderSide(
                  width: 2,
                  color: Color.fromRGBO(218, 218, 218, 1),
                ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          onChanged: (newValue) {
            BlocProvider.of<TaskCubit>(context)
                .updateTaskIsComplete(task, newValue!);
          },
          value: task.isComplete,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(task.title, style: Theme.of(context).textTheme.bodyText2,),
      ],
    );
  }
}
