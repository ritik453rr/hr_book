import 'package:core_hr/navigation/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  void navigation() async {
    await Future.delayed(Duration(seconds: 2));
    Get.offNamed(AppRoutes.login);
  }
}
