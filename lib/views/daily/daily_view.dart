import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/models/task_model.dart';
import 'package:task_manager/res/routes/routes_name.dart';
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
    _vm.getTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Todos'),
        actions: [
          IconButton(
            onPressed: () => _vm.addTaskDialogBox(context),
            icon: const Icon(
              Icons.add,
              color: Colors.green,
              size: 30,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.blueAccent,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                onPressed: () => Get.toNamed(RoutesName.profileView),
                icon: const Icon(
                  Icons.account_circle,
                  color: Colors.white,
                  size: 30,
                ),
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
                total: _vm.totalTasks.value,
                completed: _vm.completedTasks.value,
                color: _vm.statusColor.value,
                message: _vm.statusMessage.value,
              ),
            ),
            Utils.verticalSpace(),
            Expanded(
              child: Obx(
                () => ListView.builder(
                  itemCount: _vm.dailyTasksList.length,
                  itemBuilder: (context, index) {
                    TaskModel task = _vm.dailyTasksList[index];
                    return Card(
                      child: ListTile(
                        onLongPress: () {
                          _vm.deleteTask(index);
                        },
                        title: Text(task.task.toString()),
                        trailing: Checkbox(
                          value: task.isCompleted,
                          onChanged: (val) {
                            _vm.updateTaskStatus(task);
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
