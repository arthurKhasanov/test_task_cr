import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

part 'database.g.dart';

class Tasks extends Table {
  // autoIncrement дает возможность использовать id как ключ
  IntColumn get id => integer().autoIncrement()();
  // длина ограничена 32 символами
  TextColumn get title => text().withLength(min: 0, max: 32)();
  // знвчение "выполненности  задачи"
  BoolColumn get isComlete => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(tables: [Tasks])
class TaskDatabase extends _$TaskDatabase {
  TaskDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  // получить все  Task'и
  Future<List<Task>> getAllTasks() => select(tasks).get();

  // добавление task'а
  Future insertTask(TasksCompanion task) => into(tasks).insert(task);

  // Обновить свойство isComplete
  Future updateTaskIsComlete(Task task, bool isComplete) {
    final Task updatedTask = Task(
      id: task.id,
      title: task.title,
      isComplete: isComplete,
    );
    return update(tasks).replace(updatedTask);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Располагаем дб в папке "Documents"
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
