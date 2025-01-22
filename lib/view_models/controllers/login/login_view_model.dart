import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/res/constants/constants.dart';
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
  onLogin() async {
    if (loginFormKey.currentState!.validate()) {
      SharedPreferences sp = await SharedPreferences.getInstance();

      String user = {
        'username': usernameController.text,
        'password': passwordController.text,
      }.toString();

      sp.setString(StorageKeys.user, user);
      Get.offAndToNamed(RoutesName.homeView);
    }
  }
}
