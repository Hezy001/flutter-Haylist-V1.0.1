import 'package:hive/hive.dart';

part 'todo.g.dart';

@HiveType(typeId: 0)
class Todo extends HiveObject {
  @HiveField(0)
  String taskName;

  @HiveField(1)
  bool taskCompleted;

  Todo({
    required this.taskName,
    required this.taskCompleted,
  });
}
