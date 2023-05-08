import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function(bool?) checkBoxCallback;
  final Function() longPressCallback;

  const TaskTile({
    super.key,
    required this.taskTitle,
    required this.isChecked,
    required this.checkBoxCallback,
    required this.longPressCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0, right: 30.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: isChecked ? Colors.grey.shade100 : Colors.grey.shade200,
              borderRadius: const BorderRadius.all(
                Radius.circular(20.0),
              ),
            ),
            child: ListTile(
              onLongPress: longPressCallback,
              title: Text(
                taskTitle,
                style: TextStyle(
                  decoration: (isChecked ? TextDecoration.lineThrough : null),
                  fontSize: 20.0,
                  color: isChecked ? Colors.black45 : Colors.black,
                ),
              ),
              trailing: Checkbox(
                activeColor: Colors.lightBlueAccent,
                value: isChecked,
                onChanged: checkBoxCallback,
              ),
            ),
          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }
}
