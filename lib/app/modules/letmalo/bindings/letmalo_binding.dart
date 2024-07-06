import 'package:get/get.dart';

import '../controllers/letmalo_controller.dart';

class LetmaloBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LetmaloController>(
      () => LetmaloController(),
    );
  }
}
