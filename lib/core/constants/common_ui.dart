import 'package:core_hr/core/constants/app_colors.dart';
import 'package:core_hr/core/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Provides common reusable UI helpers used across the app.
class CommonUi {
  /// Wraps the given widget with SafeArea and adjusts bottom padding based on platform.
  static Widget safeArea({required Widget child}) {
    return SafeArea(bottom: GetPlatform.isIOS ? false : true, child: child);
  }

  /// Shows a common snackbar (success or failed) with required message.
  static void showSnackBar({required String message, required bool isSuccess}) {
    Get.snackbar(
      isSuccess ? "Success" : "Failed",
      message,
      backgroundColor: isSuccess ? Colors.green : Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.symmetric(horizontal: AppConstants.hzSpace),
      borderRadius: 8,
      duration: const Duration(seconds: 3),
      icon: Icon(
        isSuccess ? Icons.check_circle : Icons.error,
        color: Colors.white,
      ),
    );
  }
}
