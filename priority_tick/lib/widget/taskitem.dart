import 'package:flutter/material.dart';

import '../model/tasks.dart';

class TaskAttr extends StatelessWidget {
  final Tasks todo;
  final onChanged;
  final onDelete;

  const TaskAttr({
    Key? key,
    required this.todo,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Text(
          todo.taskText!,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontFamily: 'Gabarito',
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: Icon(Icons.close),
            onPressed: () {
              onDelete(todo.id);
            },
          ),
        ),
      ),
    );
  }
}