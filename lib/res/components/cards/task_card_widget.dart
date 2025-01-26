import 'package:flutter/material.dart';
import 'package:task_manager/models/task_model.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.task,
    required this.onDelete,
    required this.onUpdate,
    required this.onEdit,
    this.horizontalMargin = 12,
    this.verticalMargin = 6,
  });

  final TaskModel task;
  final VoidCallback onDelete;
  final VoidCallback onUpdate;
  final VoidCallback onEdit;
  final double? horizontalMargin;
  final double? verticalMargin;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: horizontalMargin!,
        vertical: verticalMargin!,
      ),
      child: ListTile(
        onLongPress: onDelete,
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            onUpdate();
          },
        ),
        title: Text(task.task.toString()),
        subtitle: (task.description != null && task.description != "")
            ? Text(task.description!)
            : null,
        trailing: PopupMenuButton(
          itemBuilder: (context) => const [
            PopupMenuItem(
              value: 1,
              child: Text('Edit'),
            ),
            PopupMenuItem(
              value: 2,
              child: Text('Delete'),
            ),
          ],
          offset: const Offset(0, 40),
          color: Colors.white,
          elevation: 2,
          onSelected: (value) {
            switch (value) {
              case 1:
                onEdit();
                break;
              case 2:
                onDelete();
                break;
            }
          },
        ),
      ),
    );
  }
}
