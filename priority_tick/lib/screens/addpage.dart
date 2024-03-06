import 'package:flutter/material.dart';
import 'package:priority_tick/components/head.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  _AddPageState createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF222f5b),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MyHeader(
              height: 76,
              title: 'Add Task',
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Card(
                elevation: 5,
                margin: EdgeInsets.all(16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('lib/assets/self.png'),
                        width: 100,
                        height: 100,
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Andhika Reihan Hervito",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Reihan'),
                      SizedBox(height: 8),
                      Divider(),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}