import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileViewModel extends GetxController {
  // ======================== CONTROLLERS ========================
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final hintAnswerController = TextEditingController();

  // ======================== FOCUS NODES ========================
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final hintAnswerFocusNode = FocusNode();

  // ======================== RX VALUES ========================
  // ======================== VARIABLES ========================
  int? selectedQuestion;
  final formKey = GlobalKey<FormState>();
  // ===================== CONTROLLERS =====================
}
