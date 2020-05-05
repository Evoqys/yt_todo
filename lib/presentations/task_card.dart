import 'package:flutter/material.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/models/task_model.dart';
import 'package:yt_todo/services/task_service.dart';
import 'package:yt_todo/utilities/enum_utilities.dart';

class TaskCard extends StatelessWidget {
  final Task task;
  TaskCard(this.task);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(task.title),
              Text(enumValueToString(task.status)),
              IconButton(
                icon: Icon(Icons.edit, color: Colors.blue,),
                onPressed: () {
                  Navigator.pushNamed(context, '/addTask', arguments: this.task);
                },

              )
            ],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(task.description),
              IconButton(
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onPressed: _deleteTask,
              )
            ],
          )
        ],
      ),
    );
  }
  _deleteTask() {
    locator<TaskService>().deleteTask(this.task.id);
  }
}
