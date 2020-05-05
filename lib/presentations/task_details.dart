import 'package:flutter/material.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/models/task_model.dart';
import 'package:yt_todo/services/task_service.dart';
import 'package:flushbar/flushbar.dart';

class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  TaskService _taskService = locator<TaskService>();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  Task task;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      task = ModalRoute.of(context).settings.arguments;
      if(task!=null) {
        _titleController.text = task.title;
        _descriptionController.text = task.description;
        setState(() {
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Task Details'),),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Title'),
            TextFormField(
              controller: _titleController,
            ),
            SizedBox(height: 50,),
            Text('Description', textAlign: TextAlign.left,),
            TextFormField(
              controller: _descriptionController,
            ),
            Expanded(child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Center(
                  child: RaisedButton(
                    onPressed: task != null? _updateTask : _addTask,
                    child: Text(task != null ? 'Update Task': 'Add Task'),
                    textColor: Colors.white,
                    color: Colors.black,
                      elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),

                  ),
                ),
                SizedBox(height: 30,)
              ],
            ))
          ],
        ),
      ),
    );
  }

  _addTask() {
  print(_titleController.value.text);
  print(_descriptionController.value.text);
    Map<String, dynamic> map = {
      'title': _titleController.value.text,
      'description': _descriptionController.value.text
    };
    _taskService.addTask(map);
    Navigator.pop(context);
  }

  _updateTask() {
    Map<String, dynamic> updates = {};
    if(_titleController.value.text != task.title) {
      updates.addAll({
        'title': _titleController.value.text
      });
    }
    if(_descriptionController.value.text != task.description) {
      updates.addAll({
        'description': _descriptionController.value.text
      });
    }
    print(task.status);
    _taskService.updateTask(task, updates);
    Navigator.pop(context);
  }

}
