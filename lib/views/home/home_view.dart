import 'package:flutter/material.dart';
import 'package:task_manager/res/components/navbar/bottom_nav_bar_widget.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text('Todos'),
          ),
          body: const TabBarView(
            children: [
              Center(
                child: Text('Daily View'),
              ),
              Center(
                child: Text('Weekly View'),
              ),
              Center(
                child: Text('Monthly View'),
              ),
            ],
          ),
          bottomNavigationBar: const BottomNavBarWidget(),
        ),
      ),
    );
  }
}
