import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task_model.dart';

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
  RxList monTaskList = <TaskModel>[].obs;

  // ========================== VARIABLES ==========================
  final formKey = GlobalKey<FormState>();

  // ========================== METHODS ==========================
}
