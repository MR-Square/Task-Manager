import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/res/routes/routes_name.dart';

class LoginViewModel extends GetxController {
  // controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // focus nodes
  final usernameFocusnode = FocusNode();
  final passwordFocusnode = FocusNode();

  // Rx values
  RxBool loading = false.obs;

  // Variables
  final loginFormKey = GlobalKey<FormState>();

  RxBool isPassswordVisible = false.obs;

  // Methods
  onLogin() {
    if (loginFormKey.currentState!.validate()) {
      Get.offAndToNamed(RoutesName.homeView);
    }
  }
}
