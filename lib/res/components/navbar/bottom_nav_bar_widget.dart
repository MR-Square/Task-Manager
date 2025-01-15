import 'package:flutter/material.dart';
import 'package:task_manager/utils/utils.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Utils.width,
      height: Utils.heightPer(8),
      color: const Color(0xffF5F5F5),
      child: const TabBar(
        dividerHeight: 0,
        tabs: [
          Tab(
            icon: Icon(Icons.widgets_outlined),
            text: 'Daily',
          ),
          Tab(
            icon: Icon(Icons.view_comfy_alt_outlined),
            text: 'Weekly',
          ),
          Tab(
            icon: Icon(Icons.calendar_month_outlined),
            text: 'Monthly',
          ),
        ],
      ),
    );
  }
}
