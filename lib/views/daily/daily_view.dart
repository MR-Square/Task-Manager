import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/view_models/controllers/daily/daily_view_model.dart';
import 'package:task_manager/views/daily/dashboard_card_widget.dart';

class DailyView extends StatefulWidget {
  const DailyView({super.key});

  @override
  State<DailyView> createState() => _DailyViewState();
}

class _DailyViewState extends State<DailyView> {
  final _vm = Get.put(DailyViewModel());

  @override
  void initState() {
    super.initState();
    _vm.getDailyTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Todos'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: IconButton(
              onPressed: () => _vm.onAddDailyTask(context),
              icon: const Icon(
                Icons.add,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Utils.horizontalSpace(100),
            Obx(
              () => DashboardCardWidget(
                total: _vm.totalDailyTasks.value,
                completed: _vm.totalCompletedTasks.value,
              ),
            ),
            Utils.verticalSpace(),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _vm.dailyTaskList.length,
                  itemBuilder: (context, index) {
                    TaskModel task = _vm.dailyTaskList[index];
                    return Card(
                      child: ListTile(
                        onLongPress: () {
                          _vm.deleteDailyTask(index);
                        },
                        title: Text(task.task.toString()),
                        trailing: Checkbox(
                          value: task.isCompleted,
                          onChanged: (val) {
                            task.isCompleted = !task.isCompleted!;
                            if (task.isCompleted!) {
                              _vm.totalCompletedTasks.value++;
                            } else {
                              _vm.totalCompletedTasks.value--;
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
