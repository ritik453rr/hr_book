import 'dart:io';

import 'package:core_hr/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppConstants {
  static const topSpace = 32.0;
  static const hzSpace = 20.0;
  static const bottomSpace = 32.0;

   // Hides the keyboard by removing focus from the current input field
  static hideKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

   // Haptic feedback for the device
  static void hapticFeedback() {
    if (Platform.isIOS) {
      HapticFeedback.lightImpact();
    } else {
      HapticFeedback.vibrate();
    }
  }

  /// Field is required validator
  static String? fieldIsRequired(String? value) {
    if (value == null || value.isEmpty) {
      return "This field is required";
    }
    return null;
  }

  /// Set safe area color in view
  static void setSafeArea({bool isDark = false}) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
            isDark ? AppColors.c000000 : AppColors.cFFFFFF,
        systemNavigationBarIconBrightness:
            isDark ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
      ),
    );
  }

  /// Method to validate email and return error message
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email is required";
    }
    if (!RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z][a-zA-Z0-9.-]*\.[a-zA-Z]{2,}$',
    ).hasMatch(email)) {
      return "Enter valid email";
    } else {
      return null;
    }
  }
}
