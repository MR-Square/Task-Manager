import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';

class DailyViewModel extends GetxController {
  // ====================== RX VALUES ======================
  RxInt totalDailyTasks = 0.obs;
  RxInt totalCompletedTasks = 0.obs;
  // ====================== CONTROLLER ======================
  final addTaskController = TextEditingController();

  // ====================== LISTS ======================
  RxList dailyTaskList = <TaskModel>[].obs;

  // ====================== METHODS ======================
  // Method to add task
  onAddDailyTask(BuildContext context) {
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
                addDailyTask(addTaskController.text);
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

  // Method to fetch stored daily tasks:
  getDailyTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String>? dailyTasks = sp.getStringList('daily-tasks');

    if (dailyTasks != null) {
      dailyTaskList.value = dailyTasks
          .map(
            (task) => TaskModel.fromJson(
              json.decode(task),
            ),
          )
          .toList();
      totalDailyTasks.value = dailyTaskList.length;
      totalCompletedTasks.value = dailyTaskList
          .where((task) => task.isCompleted == true)
          .toList()
          .length;
    }
  }

  // Method to add new task in memory:
  addDailyTask(String task) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    dailyTaskList.insert(
      0,
      TaskModel(
        id: dailyTaskList.length,
        task: task,
        isCompleted: false,
        isDeleted: false,
      ),
    );
    totalDailyTasks.value = dailyTaskList.length;
    totalCompletedTasks.value =
        dailyTaskList.where((task) => task.isCompleted == true).toList().length;

    List<String>? dailyTasks = dailyTaskList
        .map(
          (task) => json.encode(
            task.toJson(),
          ),
        )
        .toList();

    sp.setStringList('daily-tasks', dailyTasks);
  }

  // Method to delete stored tasks:
  deleteDailyTask(int index) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    dailyTaskList.removeAt(index);
    sp.remove('daily-tasks');
  }

  saveDailyTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String> dailyTasks = dailyTaskList
        .map(
          (task) => json.encode(
            task.toJson(),
          ),
        )
        .toList();
    sp.setStringList('daily-tasks', dailyTasks);
  }
}
