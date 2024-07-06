import 'package:get/get.dart';

import '../controllers/razrab_controller.dart';

class RazrabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RazrabController>(
      () => RazrabController(),
    );
  }
}
