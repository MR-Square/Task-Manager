import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/res/constants/constants.dart';
import 'package:task_manager/utils/utils.dart';

class WeeklyViewModel extends GetxController {
  // ========================== CONTROLLER ==========================
  final titleController = TextEditingController();
  final subTitleController = TextEditingController();

  // ========================== FOCUS NODES ==========================
  final titleFocusNode = FocusNode();
  final subTitleFocusNode = FocusNode();

  // ========================== RX VALUES ==========================
  RxList weeklyTaskList = <TaskModel>[].obs;

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

  // Method to update storage
  updateStorage() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    // First removing old one:
    sp.remove(StorageKeys.weeklyTaskList);

    // converting dart object to json format:
    List<String> tasks = weeklyTaskList
        .map(
          (task) => json.encode(
            task.toJson(),
          ),
        )
        .toList();

    // storing into storage:
    sp.setStringList(
      StorageKeys.weeklyTaskList,
      tasks,
    );
  }

  // Method to get stored tasks:
  getTasks() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    List<String>? tasks = sp.getStringList(StorageKeys.weeklyTaskList);

    if (tasks != null) {
      weeklyTaskList.value = tasks
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
    weeklyTaskList.insert(
      0,
      TaskModel(
        id: weeklyTaskList.length,
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
    weeklyTaskList.refresh();
    updateStorage();
  }

  // Method to delete task:
  deleteTask(int index) {
    weeklyTaskList.removeAt(index);
    updateStorage();
  }
}
