// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:state_management/models/task_data.dart';
import 'package:state_management/screens/tasks_screen.dart';
import 'package:state_management/utilties/log_printer.dart';

final logger = Logger(printer: MyLogfmtPrinter('main'));

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) {
        return TaskData();
      },
      child: const MaterialApp(
        home: TasksScreen(),
      ),
    );
  }
}
