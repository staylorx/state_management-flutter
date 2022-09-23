import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:state_management/utilties/log_printer.dart';

final logger = Logger(printer: MyLogfmtPrinter('task_tile'));

class TaskTile extends StatelessWidget {
  final String taskTitle;
  final bool isChecked;
  final Function(bool?) checkboxCallback;

  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkboxCallback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        value: isChecked,
        onChanged: checkboxCallback,
      ),
    );
  }
}
