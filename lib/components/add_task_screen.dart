// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'package:state_management/utilties/log_printer.dart';

final logger = Logger(printer: MyLogfmtPrinter('add_task_screen'));

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF757575),
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Text('Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.lightBlueAccent,
                  )),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
              ),
              TextButton(
                onPressed: () {
                  logger.d('add task to list');
                },
                child: Text("Add",
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                    )),
              )
            ]),
      ),
    );
  }
}
