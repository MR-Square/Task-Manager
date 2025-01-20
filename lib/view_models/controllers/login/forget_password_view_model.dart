import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordViewModel extends GetxController {
  // ========================== CONTROLLERS ==========================
  final passwrodController = TextEditingController();
  final confirmPasswrodController = TextEditingController();
  final hintAnswerController = TextEditingController();

  // ========================== FOCUS NODES ==========================
  final passwordFocusNode = FocusNode();
  final confirmpasswordFocusNode = FocusNode();
  final hintAnswerFocusNode = FocusNode();

  // ========================== RX VALUES ==========================
  // ========================== VARIABLE ==========================
  int? selectedQuestion;
  final formKey = GlobalKey<FormState>();
  // ========================== LISTS ==========================
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
  // ========================== METHODS ==========================
}
