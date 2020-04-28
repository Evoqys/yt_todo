import 'package:flutter/material.dart';
import 'package:yt_todo/presentations/task_list.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Todo App'),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: TaskList(),
      ),
    );
  }
}
