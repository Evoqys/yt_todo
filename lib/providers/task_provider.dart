

import 'package:flutter/material.dart';
import 'package:yt_todo/models/task_model.dart';

class TaskProvider with ChangeNotifier {

  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool val) {
    _isLoading = val;
    notifyListeners();
  }

  bool _isAdding = false;
  bool get isAdding => _isAdding;
  set isAdding(bool val) {
    _isAdding = val;
    notifyListeners();
  }

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

  updateTask(Task task) {
    int index = _tasks.indexWhere((t) => t.id == task.id);
    _tasks.replaceRange(index, index+1, [task]);
    notifyListeners();
  }

  deleteTask(String id) {
    _tasks.removeWhere((v) => v.id == id);
    notifyListeners();
  }
}