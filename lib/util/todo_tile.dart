// Import Flutter's material design library
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

// Stateless widget for a single to-do item
class ToDoTile extends StatelessWidget {
  final String taskName; // Task description
  final bool taskCompleted; // Completion status
  final Function(bool?)? onChanged; // Checkbox toggle handler
  final Function(BuildContext)? deleteFunction; // Delete handler

  // Constructor
  const ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0), // Outer spacing
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                if (deleteFunction != null) {
                  deleteFunction!(context);
                }
              },
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(12),
            ),
          ],
        ),
        child: Container(
          padding: EdgeInsets.all(24), // Inner spacing
          decoration: BoxDecoration(
            color: Colors.yellow,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                taskName,
                style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}