import 'package:core_hr/core/common/custom_button.dart';
import 'package:core_hr/core/common/custom_text_field.dart';
import 'package:core_hr/core/constants/app_constants.dart';
import 'package:core_hr/core/constants/assets.dart';
import 'package:core_hr/core/text/app_text_style.dart';
import 'package:core_hr/extension/app_extension.dart';
import 'package:core_hr/features/auth/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
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
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppConstants.hzSpace),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        vertical: AppConstants.topSpace,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Get.width.w,
                          AppConstants.topSpace.h,
                          Center(
                            child: Image.asset(Assets.pngSplashImg, width: 300),
                          ),
                          24.h,
                          Text("Email", style: AppTextStyle.robotoMedium14),
                          4.h,
                          CustomTextField(
                            controller: controller.emailController,
                            hintText: "Enter email...",
                            validator: (val) => AppConstants.validateEmail(val),
                          ),
                          16.h,
                          Text("Password", style: AppTextStyle.robotoMedium14),
                          4.h,
                          CustomTextField(
                            controller: controller.passwordController,
                            hintText: "Enter password...",
                            validator:
                                (val) => AppConstants.fieldIsRequired(val),
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    title: "Login",
                    onPressed: () {
                      if (formKey.currentState!.validate()) {}
                    },
                  ),
                  AppConstants.bottomSpace.h,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
