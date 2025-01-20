import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupViewModel extends GetxController {
  // ======================== CONTROLLERS ========================
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final hintAnswerController = TextEditingController();

  // ======================== FOCUS NODES ========================
  final usernameFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final confirmpasswordFocusNode = FocusNode();
  final hintAnswerFocusNode = FocusNode();

  // ======================== RX VALUES ========================
  // ======================== VARIABLES ========================
  int? selectedQuestion;
  final formKey = GlobalKey<FormState>();

  // ======================== LISTS ========================
  List questionsList = [
    {
      "id": 0,
      "question": "What is your favourite food?",
      "value": 1,
    },
    {
      "id": 1,
      "question": "What is your birth place?",
      "value": 2,
    },
    {
      "id": 2,
      "question": "What is your first school?",
      "value": 3,
    },
  ];

  // ======================== METHODS ========================
}
