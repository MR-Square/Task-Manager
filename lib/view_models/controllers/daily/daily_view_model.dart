import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/res/constants/constants.dart';
import 'package:task_manager/utils/utils.dart';

class DailyViewModel extends GetxController {
  // ======================== RX VALUES ========================
  // INT
  RxInt totalTasks = 0.obs;
  RxInt completedTasks = 0.obs;

  // COLORS
  final statusColor = Colors.redAccent.obs;

  // STRINGS
  RxString statusMessage = 'Keep it up'.obs;

  // LISTS
  RxList dailyTasksList = <TaskModel>[].obs;

  // ======================== CONTROLLERS ========================
  final addTaskController = TextEditingController();

  // ======================== METHODS ========================

  // Method to fetch tasks from storage:
  getTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String>? tasks = sp.getStringList(StorageKeys.dailyTasksList);

    if (tasks != null) {
      dailyTasksList.value = tasks
          .map(
            (task) => TaskModel.fromJson(
              json.decode(task),
            ),
          )
          .toList();
      totalTasks.value = dailyTasksList.length;
      completedTasks.value = dailyTasksList
          .where(
            (task) => task.isCompleted == true,
          )
          .length;
      if (completedTasks.value == totalTasks.value) {
        statusColor.value = Colors.greenAccent;
        statusMessage.value = "Well Done";
      } else {
        statusColor.value = Colors.redAccent;
        statusMessage.value = "Keep it up";
      }
    }
  }

  // Method to show [dialog box] to add new task:
  addTaskDialogBox(BuildContext context) {
    Utils.showDialogBox(
      context,
      'Add Task',
      SimpleInputfieldWidget(
        controller: addTaskController,
        labelText: 'Task',
      ),
      onCancel: () {
        addTaskController.clear();
        Get.back();
      },
      onConfirm: () {
        addTask(addTaskController.text);
        addTaskController.clear();
        Get.back();
      },
    );
  }

  // Method to show dialogbox to delete task:
  deleteTaskDialogBox(BuildContext context, int index) {
    Utils.showDialogBox(
      context,
      'Alert',
      SizedBox(
        width: Utils.width,
        child: const Text(
          'Are you sure, you want to delete it?',
          textAlign: TextAlign.center,
        ),
      ),
      borderRadius: 12,
      confirmLabel: 'delete',
      confirmColor: Colors.red,
      cancelColor: Colors.green,
      onCancel: Get.back,
      onConfirm: () {
        deleteTask(index);
        Get.back();
        Utils.snackbarMessage(
          'Done',
          'Task deleted successfully!',
        );
      },
    );
  }

  // Method to add task:
  addTask(String task) async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    dailyTasksList.insert(
      0,
      TaskModel(
        id: dailyTasksList.length,
        task: task,
        isCompleted: false,
        isDeleted: false,
      ),
    );

    totalTasks++;
    completedTasks.value = dailyTasksList
        .where(
          (task) => task.isCompleted == true,
        )
        .length;

    if (completedTasks.value == totalTasks.value) {
      statusColor.value = Colors.greenAccent;
      statusMessage.value = 'Well Done';
    } else {
      statusColor.value = Colors.redAccent;
      statusMessage.value = 'Keep it up';
    }

    List<String>? tasks = dailyTasksList
        .map(
          (task) => json.encode(
            task.toJson(),
          ),
        )
        .toList();

    sp.setStringList(
      StorageKeys.dailyTasksList,
      tasks,
    );
  }

  // Method to delete task:
  deleteTask(int index) async {
    dailyTasksList.removeAt(index);
    totalTasks.value = dailyTasksList.length;
    completedTasks.value = dailyTasksList
        .where(
          (task) => task.isCompleted == true,
        )
        .length;
    if (completedTasks.value == totalTasks.value) {
      statusColor.value = Colors.greenAccent;
      statusMessage.value = 'Well Done';
    } else {
      statusColor.value = Colors.redAccent;
      statusMessage.value = 'Keep it up';
    }
    clearStorage();
    saveTask();
  }

  // Method to clear storage:
  clearStorage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove(StorageKeys.dailyTasksList);
  }

  // Method to save task to storage:
  saveTask() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String> tasks = dailyTasksList
        .map(
          (task) => json.encode(task.toJson()),
        )
        .toList();

    sp.setStringList(
      StorageKeys.dailyTasksList,
      tasks,
    );
  }

  // Method to update task status:
  updateTaskStatus(TaskModel task) async {
    task.isCompleted = !task.isCompleted!;
    dailyTasksList.refresh();
    if (task.isCompleted!) {
      completedTasks.value++;
    } else {
      completedTasks.value--;
    }

    if (completedTasks.value == totalTasks.value) {
      statusColor.value = Colors.greenAccent;
      statusMessage.value = 'Well Done';
    } else {
      statusColor.value = Colors.redAccent;
      statusMessage.value = 'Keep it up';
    }
    clearStorage();
    saveTask();
  }
}
