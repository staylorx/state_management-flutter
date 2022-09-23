// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:state_management/components/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TaskTile(
          taskTitle: 'This is task 1',
          isChecked: false,
        ),
        TaskTile(
          taskTitle: 'This is task 2',
          isChecked: true,
        ),
        TaskTile(
          taskTitle: 'This is task 3',
          isChecked: false,
        ),
      ],
    );
  }
}
