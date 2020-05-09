import 'dart:convert';

import 'package:uuid/uuid.dart';
import 'package:yt_todo/enums/task_status.dart';
import 'package:yt_todo/env/app_env.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/models/task_model.dart';
import 'package:yt_todo/providers/task_provider.dart';
import 'package:yt_todo/utilities/enum_utilities.dart';
import 'package:http/http.dart' as http;

class TaskService {

  String baseApiUrl = AppEnvironment.baseApiUrl;

  Future fetchTasks() async {
    String url = baseApiUrl + '/tasks';
    _taskProvider.isLoading = true;
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<Task> _tasks = [];
        dynamic body = json.decode(response.body);
        body.forEach((val) {
          _tasks.add(Task.fromMap(val));
        });
        _taskProvider.tasks = _tasks;
        _taskProvider.isLoading = false;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _taskProvider.isLoading = false;
      }
    } catch(e) {
      _taskProvider.isLoading = false;
      throw(e);
    }
  }

  TaskProvider _taskProvider = locator<TaskProvider>();
  var uuid = new Uuid();
  addTask(Map<String, dynamic> task) {
    task.addAll({
      'id': uuid.v1(),
      'status': enumValueToString(TaskStatus.OPEN) // open
    });
    _taskProvider.addTask(Task.fromMap(task));
  }


  updateTask(Task task, Map<String, dynamic> updates) {
    Map<String, dynamic> map = {
      'id': task.id,
      'title': updates['title'] ?? task.title,
      'description': updates['description'] ?? task.description,
      'status': enumValueToString(task.status)
    };
    _taskProvider.updateTask(Task.fromMap(map));
  }

  deleteTask(String id) {
    _taskProvider.deleteTask(id);
  }
}