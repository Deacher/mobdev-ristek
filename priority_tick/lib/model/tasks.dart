class Tasks {
  String? id;
  String? taskText;
  bool isDone;

  Tasks({
    required this.id,
    required this.taskText,
    this.isDone = false,
  });

  static List<Tasks> todoList = [];

  static void addTask(String taskText) {
    final task = Tasks(id: DateTime.now().millisecondsSinceEpoch.toString(), taskText: taskText);
    todoList.add(task);
  }

  static void deleteTask(String taskId) {
    todoList.removeWhere((task) => task.id == taskId);
  }
}