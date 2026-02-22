import 'package:core_hr/core/constants/app_constants.dart';
import 'package:core_hr/core/constants/assets.dart';
import 'package:core_hr/core/text/app_text_style.dart';
import 'package:core_hr/extension/app_extension.dart';
import 'package:core_hr/features/splash/controller/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

/// A simple splash page that displays an image and navigates to the login page after a delay.
class SplashPage extends StatelessWidget {
  SplashPage({super.key});
  final controller = Get.find<SplashController>();
  @override
  Widget build(BuildContext context) {
    AppConstants.setSafeArea();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Get.width.w,
            Image.asset(Assets.pngAppLogo, width: 240),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text("HR BOOK", style: AppTextStyle.robotoBold24),
            ),
          ],
        ),
      ),
    );
  }
}
