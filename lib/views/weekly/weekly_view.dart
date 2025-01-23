import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/view_models/controllers/weekly/weekly_view_model.dart';

class WeeklyView extends StatefulWidget {
  const WeeklyView({super.key});

  @override
  State<WeeklyView> createState() => _WeeklyViewState();
}

class _WeeklyViewState extends State<WeeklyView> {
  final _vm = Get.put(WeeklyViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weekly Todos'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Title'),
              subtitle: Text('sub title'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        child: const Icon(Icons.add),
      ),
    );
  }
}
