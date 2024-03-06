class Tasks {
  String? id;
  String? taskText;
  bool isDone;

  Tasks({
    required this.id,
    required this.taskText,
    this.isDone = false,
  });

  static List<Tasks> todoList() {
    return [
      Tasks(id: '01', taskText: 'Morning Excercise', isDone: true ),
      Tasks(id: '02', taskText: 'Buy Groceries', isDone: true ),
      Tasks(id: '03', taskText: 'Check Emails', ),
      Tasks(id: '04', taskText: 'Team Meeting', ),
      Tasks(id: '05', taskText: 'Work on mobile apps for 2 hour', ),
      Tasks(id: '06', taskText: 'Dinner with Jenny', ),
    ];
  }
}