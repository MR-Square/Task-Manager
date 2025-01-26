import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/components/cards/task_card_widget.dart';
import 'package:task_manager/res/routes/routes_name.dart';
import 'package:task_manager/view_models/controllers/monthly/monthly_view_model.dart';

class MonthlyView extends StatefulWidget {
  const MonthlyView({super.key});

  @override
  State<MonthlyView> createState() => _MonthlyViewState();
}

class _MonthlyViewState extends State<MonthlyView> {
  final _vm = Get.put(MonthlyViewModel());

  @override
  void initState() {
    super.initState();
    _vm.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Todos'),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => Get.toNamed(RoutesName.settingsView),
              icon: const Icon(
                Icons.settings,
                color: Colors.blueGrey,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _vm.monthlyTaskList.length,
          itemBuilder: (context, index) {
            TaskModel task = _vm.monthlyTaskList[index];
            return TaskCardWidget(
              task: task,
              onDelete: () => _vm.deleteTaskDialogBox(context, index),
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
