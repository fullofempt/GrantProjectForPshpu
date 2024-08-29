import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:testik/app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); 


  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.SPLASH,
      defaultTransition: Transition.circularReveal,
      getPages: AppPages.routes,
    ));
  });
}
