import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/components/cards/task_card_widget.dart';
import 'package:task_manager/view_models/controllers/weekly/weekly_view_model.dart';

class WeeklyView extends StatefulWidget {
  const WeeklyView({super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView> {
  final _vm = Get.put(WeeklyViewModel());

  @override
  void initState() {
    super.initState();
    _vm.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Todos'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _vm.weeklyTaskList.length,
          itemBuilder: (context, index) {
            TaskModel task = _vm.weeklyTaskList[index];
            return TaskCardWidget(
              task: task,
              onDelete: () => _vm.deleteTaskDialogbox(context, index),
              onUpdate: () => _vm.updateTask(task),
              onEdit: () => _vm.editTask(context, index, task),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _vm.addTaskDialogBox(context),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
