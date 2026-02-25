import 'package:core_hr/navigation/app_routes.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

/// Controller handling authentication-related logic and navigation.
class AuthController extends GetxController {
  /// Controllers and Instances
  var emailController = TextEditingController();
  var otpController = TextEditingController();

  /// Variables
  var enableLoginBtn = false.obs;
  var enableVerifyOtpBtn = false.obs;

  /// Validates the login form and navigates to OTP verification screen on success.
  void onTapLogin({required formKey}) {
    if (formKey.currentState!.validate()) {
      Get.toNamed(AppRoutes.otpVerify);
    }
  }

  void onChangeLoginEmail(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      enableLoginBtn.value = true;
    } else {
      enableLoginBtn.value = false;
    }
  }

  void onChangeOtpField(GlobalKey<FormState> formKey) {
    if (formKey.currentState!.validate()) {
      enableVerifyOtpBtn.value = true;
    } else {
      enableVerifyOtpBtn.value = false;
    }
  }
}
