import 'package:core_hr/core/constants/app_colors.dart';
import 'package:flutter/services.dart';

class AppConstants {
  static const topSpace = 30.0;
  static const hzSpace = 20.0;
  static const bottomSpace = 20.0;

  /// Set safe area color in view
  static void setSafeArea({bool isDark=false}) {
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
}
