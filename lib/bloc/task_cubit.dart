import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_tusk_cr/bloc/task_state.dart';
import 'package:test_tusk_cr/db/database.dart';

class TaskCubit extends Cubit<TaskState> {
  final _todoDB = TaskDatabase();
  TaskCubit() : super(TaskLoadingState());

  // Получаем все Task'и
  getTasks() async {
    if (state is TaskLoadedSuccessfulState == false) {
      emit(TaskLoadingState());
    }

    try {
      final taskList = await _todoDB.getAllTasks();
      emit(TaskLoadedSuccessfulState(taskList: taskList));
    } catch (e) {
      emit(TaskLoadedFailureState(exception: e as Exception));
    }
  }
  // Создаем Task
  createTask(TasksCompanion taskCompanion) async {
    await _todoDB.insertTask(taskCompanion);
    getTasks();
  }

  // Обновляем чекбокс через isComplete в db
  updateTaskIsComplete(Task task, bool isComplete) async {
    await _todoDB.updateTaskIsComlete(task, isComplete);
    getTasks();
  }
}
