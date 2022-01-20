import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tusk_cr/bloc/task_cubit.dart';
import 'package:test_tusk_cr/db/database.dart';
import 'package:drift/drift.dart' as drift;

class TaskAddingCard extends StatelessWidget {
  TaskAddingCard({Key? key}) : super(key: key);
  final titleController = TextEditingController();

  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Hero(
          tag: 'add-task-hero',
          child: Material(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  maxLength: 32,
                  cursorColor: const Color.fromRGBO(41, 41, 47, 1),
                  autofocus: true,
                  controller: titleController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onFieldSubmitted: (inputName) {
                    BlocProvider.of<TaskCubit>(context, listen: false)
                        .createTask(TasksCompanion(
                      title: drift.Value(titleController.text),
                    ));
                    Navigator.pop(context);
                  },
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(
                          color: Color.fromRGBO(87, 87, 103, 1), width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: Color.fromRGBO(41, 41, 47, 1), width: 2.0),
                    ),
                    hintText: 'Add Task Name',
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
