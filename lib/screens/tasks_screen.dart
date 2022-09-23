// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:state_management/components/add_task_screen.dart';
import 'package:state_management/models/task.dart';
import 'package:state_management/utilties/constants.dart';

import 'package:state_management/utilties/log_printer.dart';
import 'package:state_management/components/tasks_list.dart';

final logger = Logger(printer: MyLogfmtPrinter('tasks_screen'));

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<Task> tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlueAccent,
        child: const Icon(Icons.add),
        onPressed: () {
          logger.d('FAB pressed.');

          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (container) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(addTaskCallback: (newTaskTitle) {
                  logger.d('Received $newTaskTitle');
                  setState(() {
                    tasks.add(Task(name: newTaskTitle));
                  });
                  Navigator.pop(context);
                }),
              ),
            ),
          ); //end showModalBottomSheet()
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(
                    Icons.list,
                    color: Colors.lightBlueAccent,
                    size: 30.0,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text('Todoey', style: kTitleTextStyle),
                Text(
                  '${tasks.length} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15.0),
                  topRight: Radius.circular(15.0),
                ),
              ),
              child: TasksList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}
