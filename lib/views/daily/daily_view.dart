import 'package:flutter/material.dart';

class DailyView extends StatelessWidget {
  const DailyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Todos'),
      ),
      body: const Center(
        child: Text('Daily view'),
      ),
    );
  }
}
