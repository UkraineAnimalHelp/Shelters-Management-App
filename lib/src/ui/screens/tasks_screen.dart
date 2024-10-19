import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TasksScreen extends StatelessWidget {
  const TasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Tasks'),
    );
  }
}
