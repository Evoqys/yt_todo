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
  String baseTaskApiUrl = AppEnvironment.baseApiUrl + '/tasks';

  TaskProvider _taskProvider = locator<TaskProvider>();
  var uuid = new Uuid();
  Future fetchTasks() async {
    _taskProvider.isLoading = true;
    try {
      var response = await http.get(baseTaskApiUrl);
      if (response.statusCode == 200) {
        List<Task> _tasks = [];
        dynamic body = json.decode(response.body);
        print(body.toString());
        body['data'].forEach((val) {
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
  Future addTask(Map<String, dynamic> task) async {
    _taskProvider.isAdding = true;
    try {
      var response = await http.post(baseTaskApiUrl, body: task);
      if (response.statusCode == 201) {
        dynamic body = json.decode(response.body);
        print(body.toString());
        _taskProvider.addTask(Task.fromMap(body));
        _taskProvider.isAdding = false;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _taskProvider.isAdding = false;
      }
    } catch(e) {
      _taskProvider.isAdding = false;
      throw(e);
    }
  }


  Future updateTask(Task task, Map<String, dynamic> updates) async{
    _taskProvider.isAdding = true;
    try {
      var response = await http.put(baseTaskApiUrl+'/'+task.id, body: updates);
      if (response.statusCode == 200) {
        dynamic body = json.decode(response.body);
        print(body.toString());
        _taskProvider.updateTask(Task.fromMap(body));
        _taskProvider.isAdding = false;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _taskProvider.isAdding = false;
      }
    } catch(e) {
      _taskProvider.isAdding = false;
      throw(e);
    }
  }

  Future deleteTask(String id) async {
    _taskProvider.isAdding = true;
    print(id);
    try {
      var response = await http.delete(baseTaskApiUrl+'/'+id);
      if (response.statusCode == 200) {
        _taskProvider.deleteTask(id);
        _taskProvider.isAdding = false;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        _taskProvider.isAdding = false;
      }
    } catch(e) {
      _taskProvider.isAdding = false;
      throw(e);
    }
  }
}