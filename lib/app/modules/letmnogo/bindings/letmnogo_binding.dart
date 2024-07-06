import 'package:get/get.dart';

import '../controllers/letmnogo_controller.dart';

class LetmnogoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LetmnogoController>(
      () => LetmnogoController(),
    );
  }
}
