import 'package:core_hr/core/constants/app_constants.dart';
import 'package:core_hr/navigation/app_pages.dart';
import 'package:core_hr/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: AppPages.pages,
      initialRoute: AppRoutes.splash,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      defaultTransition: Transition.rightToLeft
    );
  }
}
