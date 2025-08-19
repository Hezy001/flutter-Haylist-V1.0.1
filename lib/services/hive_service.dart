import 'package:hive_flutter/hive_flutter.dart';
import '../models/todo.dart';

class HiveService {
  static const String _todoBoxName = 'todos';
  static Box<Todo>? _todoBox;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(TodoAdapter());
    _todoBox = await Hive.openBox<Todo>(_todoBoxName);
    
    // Add sample data if the box is empty
    if (_todoBox!.isEmpty) {
      await _todoBox!.addAll([
        Todo(taskName: "Welcome to HEYLIST! 🎉", taskCompleted: false),
        Todo(taskName: "Tap the checkbox to mark as done", taskCompleted: false),
        Todo(taskName: "Swipe left to delete tasks", taskCompleted: false),
        Todo(taskName: "Tap + to add new tasks", taskCompleted: false),
      ]);
    }
  }

  static Box<Todo> get todoBox {
    if (_todoBox == null) {
      throw Exception('HiveService not initialized. Call initialize() first.');
    }
    return _todoBox!;
  }

  static List<Todo> getAllTodos() {
    return todoBox.values.toList();
  }

  static Future<void> addTodo(Todo todo) async {
    try {
      await todoBox.add(todo);
    } catch (e) {
      print('Error adding todo: $e');
      rethrow;
    }
  }

  static Future<void> updateTodo(int index, Todo todo) async {
    try {
      await todoBox.putAt(index, todo);
    } catch (e) {
      print('Error updating todo: $e');
      rethrow;
    }
  }

  static Future<void> deleteTodo(int index) async {
    try {
      await todoBox.deleteAt(index);
    } catch (e) {
      print('Error deleting todo: $e');
      rethrow;
    }
  }

  static Future<void> toggleTodo(int index) async {
    try {
      final todo = todoBox.getAt(index);
      if (todo != null) {
        todo.taskCompleted = !todo.taskCompleted;
        await todoBox.putAt(index, todo);
      }
    } catch (e) {
      print('Error toggling todo: $e');
      rethrow;
    }
  }

  static Future<void> close() async {
    await _todoBox?.close();
  }
}
