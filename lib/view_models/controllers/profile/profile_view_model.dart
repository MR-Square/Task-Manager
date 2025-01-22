import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/user_model.dart';
import 'package:task_manager/res/constants/constants.dart';
import 'package:task_manager/res/routes/routes_name.dart';

class ProfileViewModel extends GetxController {
  // ======================== CONTROLLERS ========================
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  final hintAnswerController = TextEditingController();

  // ======================== FOCUS NODES ========================
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final hintAnswerFocusNode = FocusNode();

  // ======================== RX VALUES ========================
  // ======================== VARIABLES ========================
  int? selectedQuestion;
  final formKey = GlobalKey<FormState>();

  // ===================== METHODS =====================
  getLoginDetails() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    String? userJson = sp.getString(StorageKeys.user);

    if (userJson != null) {
      // usernameController.text = ;
      Map<String, dynamic> userMap = json.decode(userJson);
      UserModel user = UserModel.fromJson(userMap);

      usernameController.value.text = user.username;
      passwordController.value.text = user.password;

      usernameController.refresh();
      passwordController.refresh();
    }
  }

  logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove(StorageKeys.user);
    Get.offAndToNamed(RoutesName.loginView);
  }
}
