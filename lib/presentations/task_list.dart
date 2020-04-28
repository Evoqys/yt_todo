

import 'package:flutter/material.dart';
import 'package:yt_todo/presentations/task_card.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: TaskCard(),
    );
  }
}
