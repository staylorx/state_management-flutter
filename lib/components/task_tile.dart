import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:state_management/utilties/log_printer.dart';

final logger = Logger(printer: MyLogfmtPrinter('task_tile'));

class TaskTile extends StatefulWidget {
  final String taskTitle;
  final bool isChecked;

  const TaskTile({
    Key? key,
    required this.taskTitle,
    required this.isChecked,
  }) : super(key: key);

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  bool isChecked = false;

  void checkboxCallback(bool? checkboxState) {
    if (checkboxState != null) {
      setState(() {
        logger.d('setting state with $checkboxState');
        isChecked = checkboxState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: TaskCheckbox(
        checkboxState: isChecked,
        toggleCheckboxState: checkboxCallback,
      ),
    );
  }
}

class TaskCheckbox extends StatelessWidget {
  final bool checkboxState;
  final Function(bool?) toggleCheckboxState;

  const TaskCheckbox({
    super.key,
    required this.checkboxState,
    required this.toggleCheckboxState,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      activeColor: Colors.lightBlueAccent,
      value: checkboxState,
      onChanged: toggleCheckboxState,
    );
  }
}
