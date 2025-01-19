import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static double width = Get.width;
  static double height = Get.height;

  /// Returns [dobule]. default value is [5].
  /// You can also pass [percentage] you want. If accepts values in between
  /// [1-100].
  static double widthPer([double? wt = 5]) => width * wt! / 100;

  /// Returns [dobule]. default value is [2].
  /// You can also pass [percentage] you want. If accepts values in between
  /// [1-100].
  static double heightPer([double? ht = 2]) => height * ht! / 100;

  /// Retrun [sizedbox] with height of [2%] of device height.
  ///
  /// You can also pass [precentage] you want.
  static Widget verticalSpace([double? ht = 2]) => SizedBox(
        height: height * ht! / 100,
      );

  /// Retrun [sizedbox] with width of [2%] of device width.
  ///
  /// You can also pass [precentage] you want.
  static Widget horizontalSpace([double? wt = 2]) => SizedBox(
        width: width * wt! / 100,
      );

  /// Return [snackbar]. You need to pass two agruments [title] and [message].
  ///
  /// If message you want to show is for [warning] or [error], then you can
  /// pass [isWarning] as [true].
  static snackbarMessage(
    String title,
    String message, {
    bool? isWarning = false,
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(
      title,
      message,
      backgroundColor: isWarning! ? Colors.red : Colors.green,
      colorText: Colors.white,
    );
  }

  /// This method is used to change the focus from one field to another field.
  /// It accepts three arguments : [context], [current] and [next].
  ///
  /// context: BuildContext.
  ///
  /// current: focusnode of current active field.
  ///
  /// next: focusnode of next field where you want to focus.
  static changeFocusNode(
    BuildContext context,
    FocusNode current,
    FocusNode next,
  ) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  /// This method is used to [unfocus] a field.
  ///
  /// You need to pass the focusnode name of field you want to unfocus.
  static unFocusField(FocusNode node) {
    node.unfocus();
  }

  static showDialogBox(
    BuildContext context,
    String title,
    List<Widget> contents, {
    VoidCallback? onCancel,
    VoidCallback? onConfirm,
    bool? dismissible = false,
    double? height,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible!,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(title)),
          shape: const LinearBorder(),
          content: SizedBox(
            height: height ?? heightPer(10),
            child: Column(
              children: contents,
            ),
          ),
          actions: [
            if (onCancel != null)
              TextButton(
                onPressed: onCancel,
                child: const Text(
                  'cancel',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            TextButton(
              onPressed: onConfirm,
              child: const Text(
                'save',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
