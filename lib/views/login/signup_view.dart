import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/res/components/butons/simple_button_widget.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/view_models/controllers/login/signup_view_model.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _vm = Get.put(SignupViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Utils.horizontalSpace(1),
            Utils.verticalSpace(12),
            const Text(
              'Signup',
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
            Utils.verticalSpace(8),
            SimpleInputfieldWidget(
              labelText: 'Username',
              controller: _vm.usernameController,
              focusNode: _vm.usernameFocusNode,
            ),
            Utils.verticalSpace(),
            SimpleInputfieldWidget(
              labelText: 'New Password',
              controller: _vm.passwordController,
              focusNode: _vm.passwordFocusNode,
            ),
            Utils.verticalSpace(),
            SimpleInputfieldWidget(
              labelText: 'Confirm Password',
              controller: _vm.confirmPasswordController,
              focusNode: _vm.confirmpasswordFocusNode,
            ),
            Utils.verticalSpace(),
            SizedBox(
              width: Utils.width,
              height: Utils.heightPer(7),
              child: DropdownButtonHideUnderline(
                child: DropdownButtonFormField(
                  hint: const Text('Hint Question'),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  value: _vm.selectedQuestion,
                  items: _vm.questionsList
                      .map(
                        (question) => DropdownMenuItem(
                          value: question['value'],
                          child: Text(
                            question['question'],
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    _vm.selectedQuestion = int.tryParse(value.toString());
                  },
                ),
              ),
            ),
            Utils.verticalSpace(),
            SimpleInputfieldWidget(
              labelText: 'Hint Answer',
              controller: _vm.hintAnswerController,
              focusNode: _vm.hintAnswerFocusNode,
            ),
            Utils.verticalSpace(15),
            SimpleButtonWidget(
              label: 'Signup',
              onPress: () {
                Get.back();
              },
              width: Utils.width,
            ),
          ],
        ),
      ),
    );
  }
}
