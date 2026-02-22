import 'package:core_hr/core/constants/app_colors.dart';
import 'package:core_hr/core/constants/app_constants.dart';
import 'package:core_hr/core/text/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double width;
  final String title;
  final void Function()? onPressed;
  const CustomButton({
    super.key,
    this.height = 0,
    this.width = 0,
    required this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.c632AA2,
        padding: EdgeInsets.all(14),
        minimumSize: Size(width == 0 ? Get.width : width, height),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      onPressed: () {
        AppConstants.hapticFeedback();
        AppConstants.hideKeyBoard();
        onPressed?.call();
      },
      child: Text(
        title,
        style: AppTextStyle.robotoBold24.copyWith(
          fontSize: 16,
          color: AppColors.cFFFFFF,
        ),
      ),
    );
  }
}
