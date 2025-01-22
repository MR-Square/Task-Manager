import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_manager/models/user_model.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/res/constants/constants.dart';
import 'package:task_manager/res/routes/routes_name.dart';
import 'package:task_manager/utils/utils.dart';

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

  /// This method is used to logout the user.
  logout() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    sp.remove(StorageKeys.user);
    Get.offAndToNamed(RoutesName.loginView);
  }

  /// This method is used to edit user name.
  editUsername(BuildContext context) {
    Utils.showDialogBox(
      context,
      'Edit Username',
      SimpleInputfieldWidget(
        controller: usernameController.value,
        labelText: 'New Username',
      ),
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        updateUser();
        usernameController.refresh();
        Get.back();
      },
    );
  }

  /// This method is used to edit user name.
  editPassword(BuildContext context) {
    Utils.showDialogBox(
      context,
      'Edit Password',
      SimpleInputfieldWidget(
        controller: passwordController.value,
        labelText: 'New Password',
      ),
      onCancel: () {
        Get.back();
      },
      onConfirm: () {
        updateUser();
        passwordController.refresh();
        Get.back();
      },
    );
  }

  /// This method is to update user details in cache memory.
  updateUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    UserModel user = UserModel(
      username: usernameController.value.text,
      password: passwordController.value.text,
    );

    String userJson = json.encode(user.toJson());

    sp.remove(StorageKeys.user);
    sp.setString(
      StorageKeys.user,
      userJson,
    );
  }
}
