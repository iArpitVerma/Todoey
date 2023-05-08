import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey/models/task_data.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.getTaskName(index),
              isChecked: taskData.isTaskChecked(index),
              checkBoxCallback: (newValue) {
                taskData.toggle(index);
              },
              longPressCallback: () {
                taskData.remove(index);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
