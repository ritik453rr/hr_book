import 'package:core_hr/core/constants/app_colors.dart';
import 'package:core_hr/core/constants/common_ui.dart';
import 'package:core_hr/core/constants/app_constants.dart';
import 'package:core_hr/core/constants/assets.dart';
import 'package:core_hr/core/constants/custom_button.dart';
import 'package:core_hr/core/text/app_fonts.dart';
import 'package:core_hr/core/text/app_text_style.dart';
import 'package:core_hr/extension/app_extension.dart';
import 'package:core_hr/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class OtpVerifyPage extends StatelessWidget {
  OtpVerifyPage({super.key});
  final controller = Get.find<AuthController>();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        AppConstants.hideKeyBoard();
      },
      child: Scaffold(
        body: CommonUi.safeArea(
          child: Container(
            width: Get.width,
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzSpace),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(top: AppConstants.topSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Image.asset(Assets.pngAppLogo, height: 150),
                        ),
                        16.h,
                        Center(
                          child: Text(
                            "OTP Verification",
                            style: AppTextStyle.robotoSemiBold24,
                          ),
                        ),
                        16.h,
                        Center(
                          child: Text(
                            "Enter OTP sent to ${controller.emailController.text}",
                            textAlign: TextAlign.center,
                            style: AppTextStyle.robotoRegular14.copyWith(
                              color: AppColors.c0F0F0F.withValues(alpha: 0.54),
                            ),
                          ),
                        ),
                        40.h,
                        Text("Enter OTP", style: AppTextStyle.robotoMedium14),
                        4.h,

                        Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          child: Pinput(
                            length: 6,
                            controller: controller.otpController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              controller.onChangeOtpField(formKey);
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Field is required";
                              }
                              if (value.length < 6) {
                                return "Enter complete OTP";
                              }
                              return null;
                            },
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 6,
                                vertical: 10,
                              ),
                              visualDensity: VisualDensity.compact,
                              minimumSize: Size(0, 0),
                              textStyle: TextStyle(
                                color: AppColors.primaryColor,
                                fontFamily: AppFonts.roboto,
                                fontWeight: FontWeight.w500,
                                fontSize: 14,
                              ),
                            ),
                            onPressed: () {
                              AppConstants.hideKeyBoard();
                              AppConstants.hapticFeedback();
                              CommonUi.showSnackBar(
                                message: "OTP sent successfully",
                                isSuccess: true,
                              );
                            },

                            child: Text("Resend Otp?"),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                CustomButton(
                  title: "Verify",
                  isLoading: false.obs,
                  enable: controller.enableVerifyOtpBtn,
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      AppConstants.hideKeyBoard();
                      // Call verify method here
                      print("OTP Verified: ${controller.otpController.text}");
                    }
                  },
                ),

                AppConstants.bottomSpace.h,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
