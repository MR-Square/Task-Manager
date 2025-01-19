import 'package:flutter/material.dart';
import 'package:task_manager/utils/utils.dart';

class DashboardCardWidget extends StatelessWidget {
  const DashboardCardWidget({
    super.key,
    required this.total,
    required this.completed,
    required this.color,
    required this.message,
  });

  final int total;
  final int completed;
  final Color color;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.width,
      height: Utils.heightPer(20),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Todo Done',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                message,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
          Container(
            width: Utils.widthPer(35),
            height: Utils.widthPer(35),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: color,
            ),
            child: Center(
              child: Text(
                '$completed/$total',
                style: const TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
