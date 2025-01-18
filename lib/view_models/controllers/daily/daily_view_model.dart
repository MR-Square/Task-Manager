import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';

class DailyViewModel extends GetxController {
  // ====================== CONTROLLER ======================
  final addTaskController = TextEditingController();

  // ====================== LISTS ======================
  RxList dailyTaskList = <TaskModel>[].obs;

  // ====================== METHODS ======================
  // Method to add task
  addDailyTask(BuildContext context) {
    /**
     ISME DIALOG BOX ADD KARNA HAI.
     DIALOG BOX ME 3 CHIZE HO GI: INPUT FIELD, CANCEL AND ADD BUTTON
    */
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('Add Task')),
          shape: const LinearBorder(),
          content: SimpleInputfieldWidget(
            controller: addTaskController,
            labelText: 'Task',
          ),
          // contentPadding: const EdgeInsets.all(4),
          actions: [
            TextButton(
              onPressed: () {
                addTaskController.clear();
                Get.back();
              },
              child: const Text(
                'cancel',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                dailyTaskList.insert(
                  0,
                  TaskModel(
                    id: dailyTaskList.length,
                    task: addTaskController.text,
                    isCompleted: false,
                    isDeleted: false,
                  ),
                );
                addTaskController.clear();
                Get.back();
              },
              child: const Text(
                'save',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
