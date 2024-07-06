import 'package:get/get.dart';

import '../controllers/viborzad_controller.dart';

class ViborzadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViborzadController>(
      () => ViborzadController(),
    );
  }
}
