import 'package:flutter/material.dart';
import 'package:priority_tick/components/head.dart';
import 'package:priority_tick/model/tasks.dart';
import 'package:priority_tick/screens/addpage.dart';
import 'package:priority_tick/widget/taskitem.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final tasksList = Tasks.todoList;
  List<Tasks> _foundtask = [];
  final _taskController = TextEditingController();

  @override
  void initState() {
    _foundtask = tasksList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222f5b),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: MyHeader(
              height: 76,
              title: 'Priority Tick',
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 86),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      searchBox(),
                      Container(
                        margin: EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: Text(
                          'Your Tasks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Gabarito',
                            color: Colors.white
                          ),
                        ),
                      ),
                      for (Tasks todoo in _foundtask.reversed)
                        TaskAttr(
                          todo: todoo,
                          onChanged: _handleChange,
                          onDelete: _deleteItem,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                        hintText: 'Add a new todo item',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  child: Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                  onPressed: () {
                    _addtask(_taskController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    minimumSize: Size(60, 60),
                    elevation: 10,
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddPage()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xFF105857),
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      )
    );
  }
  void _filter(String enteredKeyword) {
    List<Tasks> results = [];
    if (enteredKeyword.isEmpty) {
      results = tasksList;
    } else {
      results = tasksList
          .where((item) => item.taskText!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundtask = results;
    });
  }

  void _handleChange(Tasks task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  void _deleteItem(String id) {
    setState(() {
      Tasks.deleteTask(id);
    });
  }

  void _addtask(String task) {
    setState(() {
      Tasks.addTask(task);
    });
    _taskController.clear();
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        onChanged: (value) => _filter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: Colors.grey[600]),
        ),
      ),
    );
  }
}

