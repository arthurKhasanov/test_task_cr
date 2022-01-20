import 'package:test_tusk_cr/db/database.dart';

abstract class TaskState {}

// Загрузка
class TaskLoadingState extends TaskState {}

// Успешная загрузка
class TaskLoadedSuccessfulState extends TaskState {
  final List<Task> taskList;

  TaskLoadedSuccessfulState({required this.taskList});
}

// Ошибка загрузки
class TaskLoadedFailureState extends TaskState {
  final Exception exception;
  TaskLoadedFailureState({required this.exception});
}

