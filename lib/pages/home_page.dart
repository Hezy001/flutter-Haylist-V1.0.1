import 'package:heylist/util/dialog_box.dart';
import 'package:flutter/material.dart';
import 'package:heylist/util/todo_tile.dart';
import '../models/todo.dart';
import '../services/hive_service.dart';
import '../services/tutorial_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List<Todo> toDoList = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
    _checkTutorial();
  }

  void _checkTutorial() async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (await TutorialService.shouldShowTutorial()) {
        TutorialService.showTutorial(context);
      }
    });
  }

  void _loadTodos() {
    setState(() {
      toDoList = HiveService.getAllTodos();
    });
  }

  void checkBoxChanged(bool? value, int index) async {
    await HiveService.toggleTodo(index);
    _loadTodos();
  }

  void saveNewTask() async {
    if (_controller.text.trim().isNotEmpty) {
      final todo = Todo(
        taskName: _controller.text.trim(),
        taskCompleted: false,
      );
      await HiveService.addTodo(todo);
      _controller.clear();
      _loadTodos();
    }
    Navigator.of(context).pop();
  }
///create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  //delete task
  void deleteTask(int index) async {
    await HiveService.deleteTodo(index);
    _loadTodos();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.check_circle,
                color: Colors.yellow,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            const Text(
              'HEYLIST',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () => TutorialService.showTutorial(context),
            icon: const Icon(Icons.help_outline),
            tooltip: 'Show Tutorial',
          ),
        ],
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index].taskName,
            taskCompleted: toDoList[index].taskCompleted,
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}