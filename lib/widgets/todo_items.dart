import 'package:flutter/material.dart';
import 'package:todo_list/models/todo.dart';

// Widget representing a single ToDo item in the list
class ToDoItem extends StatelessWidget {
  final ToDo todo; // The ToDo object associated with this item
  final Function(ToDo) onToDoChanged; // Callback function for task completion status change
  final Function(String) onDeleteItem; // Callback function for task deletion

  // Constructor for ToDoItem, taking required parameters
  const ToDoItem({
    super.key,
    required this.todo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),  // Set margin for the ListTile container
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);  // Invoke callback function when the item is tapped
        },
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),  // Set rounded corners for the ListTile
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),  // Set content padding
        tileColor: Colors.white,  // Set background color of the ListTile
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,  // Display check box icon based on completion status
          color: Colors.blue,  // Set icon color to blue
        ),
        title: Text(
          todo.todoText,  // Display the task text
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,  // Apply strikethrough decoration if task is completed
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,  // Set background color of the delete button container to red
            borderRadius: BorderRadius.circular(5),  // Set rounded corners for the delete button container
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todo.id);  // Invoke callback function when delete button is pressed, passing task ID
            },
            icon: const Icon(
              Icons.delete,
              size: 18,
              color: Colors.white,  // Set icon color to white
            ),
          ),
        ),
      ),
    );
  }
}