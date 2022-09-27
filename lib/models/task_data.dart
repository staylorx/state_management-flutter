// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:state_management/models/task.dart';

class TaskData extends ChangeNotifier {
  // ignore: prefer_final_fields
  List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }

  void addTask({required String name}) {
    _tasks.add(Task(name: name));
    notifyListeners();
  }

  Task getTask({required int index}) {
    return _tasks[index];
  }

  void deleteTask({required Task task}) {
    _tasks.remove(task);
    notifyListeners();
  }

  void toggleDone({required Task task}) {
    task.toggleDone();
    notifyListeners();
  }

  int get size {
    return _tasks.length;
  }
}
