import 'package:flutter/material.dart';

import '../model/tasks.dart';

class TaskAttr extends StatelessWidget {
  final Tasks task;
  final onChanged;
  final onDelete;

  const TaskAttr({
    Key? key,
    required this.task,
    required this.onChanged,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onChanged(task);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Colors.blue,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.taskText!,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontFamily: 'Gabarito',
                decoration: task.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            if (task.dueDate != null)
              Text(
                'Due: ${task.dueDate}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
          ],
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
              onDelete(task.id);
            },
          ),
        ),
      ),
    );
  }
}