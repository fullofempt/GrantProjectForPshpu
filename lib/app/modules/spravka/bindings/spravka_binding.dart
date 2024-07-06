import 'package:get/get.dart';

import '../controllers/spravka_controller.dart';

class SpravkaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpravkaController>(
      () => SpravkaController(),
    );
  }
}
