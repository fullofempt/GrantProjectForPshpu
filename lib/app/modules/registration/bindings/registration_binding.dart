import 'package:get/get.dart';

import '../controllers/registration_controller.dart';

class RegistrationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegistrationScreenController>(
      () => RegistrationScreenController(),
    );
  }
}
