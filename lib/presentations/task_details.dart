import 'package:flutter/material.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/services/task_service.dart';

class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  TaskService _taskService = locator<TaskService>();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Task Details'),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _titleController,
            ),
            TextFormField(
              controller: _descriptionController,
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  onPressed: _addTask,
                  child: Text('Add a Task'),
                  textColor: Colors.white,
                  color: Colors.black,
                    elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),

                ),
              ],
            ))
          ],
        ),
      ),
    );
  }

  _addTask() {
    Map<String, dynamic> map = {
      'title': _titleController.text,
      'description': _descriptionController.text
    };
    _taskService.addTask(map);
    Navigator.pop(context);
  }
}
