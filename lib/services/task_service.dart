import 'package:uuid/uuid.dart';
import 'package:yt_todo/enums/task_status.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/models/task_model.dart';
import 'package:yt_todo/providers/task_provider.dart';

class TaskService {

  TaskProvider _taskProvider = locator<TaskProvider>();
  var uuid = new Uuid();
  addTask(Map<String, dynamic> task) {
    task.addAll({
      'id': uuid.v1(),
      'status': TaskStatus.OPEN
    });
    _taskProvider.addTask(Task.fromMap(task));
  }
}