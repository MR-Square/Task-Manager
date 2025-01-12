import 'package:flutter/material.dart';

class SimpleInputfieldWidget extends StatelessWidget {
  const SimpleInputfieldWidget({
    super.key,
    required this.labelText,
    required this.controller,
    required this.focusNode,
    required this.validateString,
    this.isPassword = false,
    this.obscureCharacter = '*',
    this.validate = false,
  });

  final String labelText;
  final TextEditingController controller;
  final FocusNode focusNode;
  final String validateString;
  final bool? isPassword;
  final String? obscureCharacter;
  final bool? validate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      obscureText: isPassword!,
      obscuringCharacter: obscureCharacter!,
      validator: validate!
          ? (value) {
              if (value == null) {
                return validateString;
              } else {
                return '';
              }
            }
          : null,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        labelText: labelText,
        counterText: '',
      ),
    );
  }
}
