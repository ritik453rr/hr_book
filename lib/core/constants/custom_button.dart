import 'package:core_hr/core/constants/app_colors.dart';
import 'package:core_hr/core/constants/app_constants.dart';
import 'package:core_hr/core/constants/common_ui.dart';
import 'package:core_hr/core/text/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// A reusable styled elevated button with built-in haptic feedback and keyboard dismissal.
class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final void Function()? onPressed;
  final RxBool isLoading;
  final RxBool enable;
  const CustomButton({
    super.key,
    this.height = 0,
    this.width = 0,
    required this.title,
    this.onPressed,
    required this.isLoading,
    required this.enable,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          overlayColor: Colors.white.withValues(alpha: 0.3),
          padding: EdgeInsets.all(14),
          minimumSize: Size(width == 0 ? Get.width : width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed:
            !enable.value
                ? null
                : () {
                  AppConstants.hapticFeedback();
                  AppConstants.hideKeyBoard();
                  onPressed?.call();
                },
        child:
            isLoading.value
                ? SizedBox(
                  height: 23,
                  width: 23,
                  child: CircularProgressIndicator(
                    color: AppColors.cFFFFFF,
                    strokeWidth: 3,
                  ),
                )
                : Text(
                  title,
                  style: AppTextStyle.robotoBold24.copyWith(
                    fontSize: 16,
                    color: AppColors.cFFFFFF,
                  ),
                ),
      ),
    );
  }
}
