import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/res/constants/constants.dart';
import 'package:task_manager/utils/utils.dart';

class MonthlyViewModel extends GetxController {
  // ========================== CONTROLLER ==========================
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();
  final completionDateController = TextEditingController();

  // ========================== FOCUS NODES ==========================
  final titleFocusNode = FocusNode();
  final subTitleFocusNode = FocusNode();
  final completionDateFocusNode = FocusNode();

  // ========================== RX VALUES ==========================
  RxList monthlyTaskList = <TaskModel>[].obs;

  // ========================== VARIABLES ==========================
  final formKey = GlobalKey<FormState>();

  // ========================== METHODS ==========================

  // Method to show dialogbox to add task:
  addTaskDialogBox(BuildContext context) {
    Utils.showDialogBox(
      context,
      'Add Task',
      SizedBox(
        height: Utils.heightPer(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              SimpleInputfieldWidget(
                labelText: 'Title',
                controller: titleController,
                focusNode: titleFocusNode,
                validateString: 'title is required',
              ),
              Utils.verticalSpace(),
              SimpleInputfieldWidget(
                labelText: 'Description',
                controller: subTitleController,
                focusNode: subTitleFocusNode,
                validateField: false,
              ),
            ],
          ),
        ),
      ),
      onCancel: () {
        Get.back();
        titleController.clear();
        subTitleController.clear();
      },
      onConfirm: () {
        if (formKey.currentState!.validate()) {
          addTask();
          Get.back();
          Utils.snackbarMessage('Done', 'New task added!');
          titleController.clear();
          subTitleController.clear();
        }
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

  // Method to update storage
  updateStorage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // First removing old one:
    sp.remove(StorageKeys.monthlyTaskList);

    // converting dart object to json format:
    List<String> tasks = monthlyTaskList
        .map(
          (task) => json.encode(
            task.toJson(),
          ),
        )
        .toList();

    // storing into storage:
    sp.setStringList(
      StorageKeys.monthlyTaskList,
      tasks,
    );
  }

  // Method to get stored tasks:
  getTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String>? tasks = sp.getStringList(StorageKeys.monthlyTaskList);

    if (tasks != null) {
      monthlyTaskList.value = tasks
          .map(
            (task) => TaskModel.fromJson(
              json.decode(task),
            ),
          )
          .toList();
    }
  }

  // Method to add task:
  addTask() {
    monthlyTaskList.insert(
      0,
      TaskModel(
        id: monthlyTaskList.length,
        task: titleController.text,
        description: subTitleController.text,
        isCompleted: false,
        isDeleted: false,
      ),
    );
    updateStorage();
  }

  // Method to update task status:
  updateTask(TaskModel task) {
    task.isCompleted = !task.isCompleted!;
    monthlyTaskList.refresh();
    updateStorage();
  }

  // Method to delete task:
  deleteTask(int index) {
    monthlyTaskList.removeAt(index);
    updateStorage();
  }
}
