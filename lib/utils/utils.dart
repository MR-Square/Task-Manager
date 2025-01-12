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
}
