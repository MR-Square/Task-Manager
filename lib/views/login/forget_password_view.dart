import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/res/components/butons/simple_button_widget.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/view_models/controllers/login/forget_password_view_model.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final _vm = Get.put(ForgetPasswordViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Change Password'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _vm.formKey,
          child: Column(
            children: [
              Utils.horizontalSpace(1),
              Utils.verticalSpace(12),
              const Text(
                'Change Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Utils.verticalSpace(8),
              SimpleInputfieldWidget(
                labelText: 'New Password',
                controller: _vm.passwrodController,
                focusNode: _vm.passwordFocusNode,
              ),
              Utils.verticalSpace(),
              SimpleInputfieldWidget(
                labelText: 'Confirm Password',
                controller: _vm.confirmPasswrodController,
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
                label: 'Change Password',
                onPress: () {},
                width: Utils.width,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
