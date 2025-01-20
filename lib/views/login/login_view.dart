import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/res/components/butons/simple_button_widget.dart';
import 'package:task_manager/res/components/inputs/simple_inputfield_widget.dart';
import 'package:task_manager/res/routes/routes_name.dart';
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
                Utils.verticalSpace(),
                SimpleInputfieldWidget(
                  labelText: 'Password',
                  controller: _vm.passwordController,
                  focusNode: _vm.passwordFocusnode,
                  validateString: 'password is required',
                  isPassword: true,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Get.toNamed(RoutesName.forgetPasswordView);
                    },
                    child: const Text(
                      'forget password',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(RoutesName.signupView);
                      },
                      child: const Text(
                        'Signup',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          shadows: [
                            Shadow(color: Colors.blue, offset: Offset(0, -1))
                          ],
                          color: Colors.transparent,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.blue,
                          decorationThickness: 2, // optional
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
