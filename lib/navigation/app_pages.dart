import 'package:core_hr/features/auth/controller/auth_controller.dart';
import 'package:core_hr/features/auth/pages/login_page.dart';
import 'package:core_hr/features/auth/pages/otp_verify_page.dart';
import 'package:core_hr/features/dashboard/page/dashboard_page.dart';
import 'package:core_hr/features/splash/controller/splash_controller.dart';
import 'package:core_hr/features/splash/pages/splash_page.dart';
import 'package:core_hr/navigation/app_routes.dart';
import 'package:get/get.dart';

/// This class defines the routes and pages for the application using GetX.
class AppPages {
  static final pages = [
    /// Splash Page
    GetPage(
      name: AppRoutes.splash,
      page: () => SplashPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SplashController());
      }),
    ),

    /// Login Page
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
    ),

    /// Otp Verify Page
    GetPage(name: AppRoutes.otpVerify, page: () => OtpVerifyPage()),

    GetPage(name: AppRoutes.dashboard, page: () => DashboardPage()),
  ];
}
