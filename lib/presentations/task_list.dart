

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/presentations/task_card.dart';
import 'package:yt_todo/providers/task_provider.dart';
import 'package:yt_todo/services/task_service.dart';

class TaskList extends StatefulWidget {
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  @override
  void initState() {
    // TODO: implement initState
    locator<TaskService>().fetchTasks();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (ctx, provider, child) {
        return provider.isLoading ?  Center(child: CupertinoActivityIndicator()) : ListView.builder(
            itemCount: provider.tasks.length,
            itemBuilder: (context, index) {
              return TaskCard(provider.tasks[index]);
            });
      },
    );
  }
}
