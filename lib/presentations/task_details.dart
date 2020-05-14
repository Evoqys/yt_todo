import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yt_todo/enums/task_status.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/models/task_model.dart';
import 'package:yt_todo/providers/task_provider.dart';
import 'package:yt_todo/services/task_service.dart';
import 'package:flushbar/flushbar.dart';
import 'package:yt_todo/utilities/enum_utilities.dart';

class TaskDetails extends StatefulWidget {
  @override
  _TaskDetailsState createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {

  TaskService _taskService = locator<TaskService>();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptionController = new TextEditingController();
  Task task;
  TaskStatus status = TaskStatus.OPEN;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      task = ModalRoute.of(context).settings.arguments;
      if(task!=null) {
        _titleController.text = task.title;
        _descriptionController.text = task.description;
        setState(() {
          status = task.status;
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
            SizedBox(height: 50,),
            task!=null ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Status'),
                ExpansionTile(
                  title: Text(enumValueToString(status).toUpperCase()),
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = TaskStatus.OPEN;
                        });
                      },
                      child: Text('Open', style: TextStyle(
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 50,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = TaskStatus.IN_PROGRESS;
                        });
                      },
                      child: Text('In Progress', style: TextStyle(
                          fontSize: 18
                      ),),
                    ),
                    SizedBox(height: 50,),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          status = TaskStatus.DONE;
                        });
                      },
                      child: Text('Done', style: TextStyle(
                          fontSize: 18
                      ),),
                    )
                  ],
                )
              ],
            ): Container(),
            Expanded(
                child: Consumer<TaskProvider>(
                  builder: (ctx, provider, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Center(
                          child: provider.isAdding? CupertinoActivityIndicator(
                            radius: 25,
                          ): RaisedButton(
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
                    );
                  },
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
    _taskService.addTask(map).then((value) {
       Navigator.pop(context);
    }).catchError((err) {

    });
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
    updates.addAll({
      'status': enumValueToString(status)
    });
    print(task.status);
    _taskService.updateTask(task, updates).then((value) {
      Navigator.pop(context);
    }).catchError((err) {

    });
  }

}
