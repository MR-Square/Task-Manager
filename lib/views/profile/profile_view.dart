import 'package:flutter/material.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/views/profile/profile_card_widget.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ProfileCardWidget(
                title: 'Username',
                onEdit: () {},
              ),
              Utils.verticalSpace(),
              ProfileCardWidget(
                title: 'Password',
                onEdit: () {},
              ),
              Utils.verticalSpace(),
              ProfileCardWidget(
                title: 'Hint Question',
                onEdit: () {},
              ),
              Utils.verticalSpace(),
              ProfileCardWidget(
                title: 'Hint Answer',
                onEdit: () {},
              ),
              const Spacer(),
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.logout,
                  color: Colors.red,
                  size: 26,
                ),
                label: const Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 25,
                  ),
                ),
              ),
              Utils.verticalSpace(5),
            ],
          ),
        ),
      ),
    );
  }
}
