import 'package:flutter/material.dart';
import 'package:task_manager/res/components/navbar/bottom_nav_bar_widget.dart';
import 'package:task_manager/views/daily/daily_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   title: const Text('Todos'),
          // ),
          body: TabBarView(
            children: [
              // Center(
              //   child: Text('Daily View'),
              // ),
              DailyView(),
              Center(
                child: Text('Weekly View'),
              ),
              Center(
                child: Text('Monthly View'),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavBarWidget(),
        ),
      ),
    );
  }
}
