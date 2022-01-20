import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tusk_cr/bloc/task_cubit.dart';
import 'package:test_tusk_cr/bloc/task_state.dart';
import 'package:test_tusk_cr/ui/widgets/empty_task_list.dart';
import 'package:test_tusk_cr/ui/widgets/failure_task_list.dart';
import 'package:test_tusk_cr/ui/widgets/hero_page_route.dart';
import 'package:test_tusk_cr/ui/widgets/loading_view.dart';
import 'package:test_tusk_cr/ui/widgets/task_adding_card.dart';
import 'package:test_tusk_cr/ui/widgets/task_list.dart';

class HomePage extends StatelessWidget {
  @override
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          toolbarHeight: 100,
          title: const Text(
            'Tasks',
          ),
          actions: [
            IconButton(
              onPressed: () {
                // переход на добавление Task'и
                Navigator.of(context).push(HeroDialogRoute(builder: (context) {
                  return TaskAddingCard();
                }));
              },
              // В зависимости от темы выбираем иконку
              icon: MediaQuery.of(context).platformBrightness == Brightness.dark
                  ? Image.asset('assets/icons/new_task_button_dark.png')
                  : Image.asset('assets/icons/new_task_button_light.png'),
              iconSize: 56,
            )
          ],
        ),
        body: BlocBuilder<TaskCubit, TaskState>(
          builder: (context, state) {
            if (state is TaskLoadedSuccessfulState) {
              return state.taskList.isEmpty
                  ? const EmptyTaskList()
                  : TaskList(taskList: state.taskList);
            } else if (state is TaskLoadedFailureState) {
              return FailureTaskList(
                exception: state.exception,
              );
            } else {
              return const LoadingView();
            }
          },
        ));
  }
}

