class Tasks {
  String? id;
  String? taskText;
  bool isDone;
  String? dueDate;

  Tasks({
    required this.id,
    required this.taskText,
    this.isDone = false,
    required this.dueDate
  });

  static List<Tasks> tasksList = [];

  static void addTask(String taskText, String dueDate) {
    final task = Tasks(id: DateTime.now().millisecondsSinceEpoch.toString(), taskText: taskText, dueDate: dueDate);
    tasksList.add(task);
  }

  static void deleteTask(String taskId) {
    tasksList.removeWhere((task) => task.id == taskId);
  }
}