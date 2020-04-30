

import 'package:flutter/material.dart';
import 'package:yt_todo/models/task_model.dart';

class TaskProvider with ChangeNotifier {


  List<Task> _tasks = [];
  List<Task> get tasks => _tasks;
  set tasks(List<Task> tasks) {
    _tasks = tasks;
    notifyListeners();
  }

  addTask(Task task) {
    _tasks.add(task);
    notifyListeners();
  }


}