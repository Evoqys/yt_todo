import 'package:uuid/uuid.dart';
import 'package:yt_todo/enums/task_status.dart';
import 'package:yt_todo/locator.dart';
import 'package:yt_todo/models/task_model.dart';
import 'package:yt_todo/providers/task_provider.dart';
import 'package:yt_todo/utilities/enum_utilities.dart';

class TaskService {

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
      'status': task.status
    };
    _taskProvider.updateTask(Task.fromMap(map));
  }

  deleteTask(String id) {
    _taskProvider.deleteTask(id);
  }
}