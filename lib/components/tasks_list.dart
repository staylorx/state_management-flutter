// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:state_management/components/task_tile.dart';
import 'package:state_management/models/task.dart';

class TasksList extends StatefulWidget {
  final List<Task> tasks;
  const TasksList({
    Key? key,
    required this.tasks,
  }) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TaskTile(
            taskTitle: widget.tasks[index].name,
            isChecked: widget.tasks[index].isDone,
            checkboxCallback: (checkboxState) {
              if (checkboxState != null) {
                setState(() {
                  logger.d('setting state with $checkboxState');
                  widget.tasks[index].toggleDone();
                });
              }
            });
      },
      itemCount: widget.tasks.length,
    );
  }
}
