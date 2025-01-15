import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/res/components/butons/simple_button_widget.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/utils/utils.dart';
import 'package:task_manager/view_models/controllers/login/login_view_model.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _vm = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _vm.loginFormKey,
            child: Column(
              children: [
                Utils.horizontalSpace(1),
                Utils.verticalSpace(18),
                const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Utils.verticalSpace(13),
                SimpleInputfieldWidget(
                  labelText: 'Username',
                  controller: _vm.usernameController,
                  focusNode: _vm.usernameFocusnode,
                  validateString: 'username is required',
                  onFieldSubmit: (val) {
                    Utils.changeFocusNode(
                      context,
                      _vm.usernameFocusnode,
                      _vm.passwordFocusnode,
                    );
                  },
                ),
                SimpleInputfieldWidget(
                  labelText: 'Password',
                  controller: _vm.passwordController,
                  focusNode: _vm.passwordFocusnode,
                  validateString: 'password is required',
                  isPassword: true,
                ),
                Utils.verticalSpace(8),
                SimpleButtonWidget(
                  label: 'Login',
                  onPress: _vm.onLogin,
                  width: Utils.width,
                ),
                Utils.verticalSpace(20),
                RichText(
                  text: const TextSpan(
                    text: 'Product of',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    children: [
                      TextSpan(
                        text: ' MR-Square',
                        style: TextStyle(
                          // color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
