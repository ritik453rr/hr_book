import 'package:core_hr/core/constants/common_ui.dart';
import 'package:core_hr/core/constants/custom_button.dart';
import 'package:core_hr/core/constants/custom_text_field.dart';
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
        body: CommonUi.safeArea(
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
                            onChanged: (value) {
                              controller.onChangeLoginEmail(formKey);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  CustomButton(
                    title: "Login",
                    isLoading: false.obs,
                    enable: controller.enableLoginBtn,
                    onPressed: () {
                      controller.onTapLogin(formKey: formKey);
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
