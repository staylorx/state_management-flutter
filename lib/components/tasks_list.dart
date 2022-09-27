// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:state_management/components/task_tile.dart';
import 'package:state_management/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
                taskTitle: task.name,
                isChecked: task.isDone,
                checkboxCallback: (checkboxState) {
                  if (checkboxState != null) {
                    taskData.toggleDone(task: task);
                  }
                },
                longPressCallback: () {
                  taskData.deleteTask(task: task);
                });
          },
          itemCount: taskData.size,
        );
      },
    );
  }
}
