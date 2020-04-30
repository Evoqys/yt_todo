import 'package:flutter/material.dart';
import 'package:yt_todo/models/task_model.dart';

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
            children: <Widget>[Text(task.title), Text(task.status.toString())],
          ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(task.description),
              Icon(
                Icons.delete,
                color: Colors.red,
              )
            ],
          )
        ],
      ),
    );
  }
}
