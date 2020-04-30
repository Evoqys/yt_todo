

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yt_todo/presentations/task_card.dart';
import 'package:yt_todo/providers/task_provider.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (ctx, provider, child) {
        return ListView.builder(
          itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
          return TaskCard(provider.tasks[index]);
        });
      },
    );
  }
}
