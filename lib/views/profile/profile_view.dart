import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/view_models/controllers/profile/profile_view_model.dart';
import 'package:task_manager/views/profile/profile_card_widget.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key}) {
    _vm.getLoginDetails();
  }

  final _vm = Get.put(ProfileViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => ProfileCardWidget(
                  title: _vm.usernameController.value.text,
                  onEdit: () => _vm.editUsername(context),
                ),
              ),
              Utils.verticalSpace(),
              Obx(
                () => ProfileCardWidget(
                  title: _vm.passwordController.value.text,
                  onEdit: () => _vm.editPassword(context),
                ),
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
              // const Spacer(),
              Utils.verticalSpace(40),
              TextButton.icon(
                onPressed: _vm.logout,
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
            ],
          ),
        ),
      ),
    );
  }
}
