import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/utils/utils.dart';
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
        centerTitle: true,
      ),
      body: Obx(
        () => ListView.builder(
          itemCount: _vm.monthlyTaskList.length,
          itemBuilder: (context, index) {
            TaskModel task = _vm.monthlyTaskList[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6),
              child: ListTile(
                onLongPress: () {
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
                      _vm.deleteTask(index);
                      Get.back();
                      Utils.snackbarMessage(
                        'Done',
                        'Task deleted successfully!',
                      );
                    },
                  );
                },
                title: Text(task.task.toString()),
                subtitle: Text(task.description ?? ''),
                trailing: Checkbox(
                  value: task.isCompleted,
                  onChanged: (val) {
                    _vm.updateTask(task);
                  },
                ),
              ),
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
