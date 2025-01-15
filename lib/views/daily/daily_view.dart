import 'package:flutter/material.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/views/daily/dashboard_card_widget.dart';

class DailyView extends StatelessWidget {
  const DailyView({super.key});

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
              onPressed: () {},
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
            const DashboardCardWidget(),
            const Center(
              child: Text('Daily view'),
            ),
          ],
        ),
      ),
    );
  }
}
