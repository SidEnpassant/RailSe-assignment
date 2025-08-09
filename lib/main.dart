import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:railseassignment/providers/task_provider.dart';
import 'package:railseassignment/screens/task_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskProvider(),
      child: MaterialApp(
        title: 'Task Manager',
        theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Roboto'),
        home: TaskListScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
