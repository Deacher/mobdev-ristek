import 'package:flutter/material.dart';
import 'package:priority_tick/components/head.dart';
import 'package:priority_tick/main.dart';
import 'package:priority_tick/model/tasks.dart';
import 'package:priority_tick/screens/listpage.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  String taskname = "";
  TextEditingController _dateController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF222f5b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              height: 76,
              title: 'Add Task',
              useBack: true,
            ),
            SizedBox(height: 16.0),
            const Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 0.0),
              child: Center(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Task Title',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Gabarito',
                      color: Colors.white
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(0.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: TextFormField(
                      style: const TextStyle(
                          fontFamily: 'Gabarito',
                          fontSize: 18,
                          color: Color.fromARGB(255, 100, 94, 89)),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color.fromARGB(195, 246, 243,243), 
                        hintText: " Task Title",
                        labelText: " Title",
                        labelStyle: const TextStyle(
                            fontFamily: 'Gabarito',
                            fontSize: 18,
                            color: Color(0xFF946b2d)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(221, 210, 210, 209),
                              width: 4.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color.fromARGB(221, 210, 210, 209),
                              width: 4.0),
                          borderRadius: BorderRadius.circular(20.0),
                        ),

                        hintStyle: const TextStyle(
                            fontFamily: 'Gabarito',
                            fontSize: 18,
                            color: Color.fromARGB(255, 190, 174, 161)),
                      ),
                      onChanged: (String? value) {
                        setState(() {
                          taskname = value!;
                        });
                      },
                      onSaved: (String? value) {
                        setState(() {
                          taskname = value!;
                        });
                      },
                      autovalidateMode:
                          AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Name cannot be empty';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
            ),
            ),
            const Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 0.0),
                child: Center(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Task Due Date',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Gabarito',
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: TextField(
                    controller: _dateController,
                    style: const TextStyle(
                      fontFamily: 'Gabarito',
                      fontSize: 18,
                      color: Color.fromARGB(255, 100, 94, 89)),
                    decoration: InputDecoration(
                      labelText: ' Date',
                      filled: true,
                      fillColor: Color.fromARGB(195, 246, 243,243), 
                      prefixIcon: Icon(Icons.calendar_today),
                      labelStyle: const TextStyle(
                        fontFamily: 'Gabarito',
                        fontSize: 18,
                        color: Color(0xFF946b2d)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(221, 210, 210, 209),
                          width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color.fromARGB(221, 210, 210, 209),
                          width: 4.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),

                    hintStyle: const TextStyle(
                        fontFamily: 'Gabarito',
                        fontSize: 18,
                        color: Color.fromARGB(255, 190, 174, 161)),
                    ),
                    readOnly: true,
                    onTap: (){
                      _selectDate();
                    },
                  ),
              ),
              SizedBox(height: 16.0),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.7,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xFF105857),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black
                          .withOpacity(0.2), // Shadow color
                      spreadRadius: 2, // Spread radius
                      blurRadius: 5, // Blur radius
                      offset: Offset(
                          0, 2), // Offset in the x, y direction
                    ),
                  ],
                ),
                child: TextButton(
                  onPressed: () {  
                    if (taskname.isNotEmpty && _dateController.text.isNotEmpty) {
                      _addtask(taskname, _dateController.text);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Task name and date cannot be empty'),
                          duration: Duration(seconds: 2), // Adjust as needed
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Add the task',
                    style: TextStyle(
                        fontFamily: 'Gabarito',
                        fontSize: 18,
                        color: Colors.white,
                        height: 1.5,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
  void _addtask(String task, String dueDate) {
    setState(() {
      Tasks.addTask(task, dueDate);
    });
    taskname = "";
    _dateController.text = "";
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000), 
      lastDate: DateTime(2100)
    );

    if (_picked != null){
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }
}