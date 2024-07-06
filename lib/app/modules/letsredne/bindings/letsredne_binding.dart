import 'package:get/get.dart';

import '../controllers/letsredne_controller.dart';

class LetsredneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LetsredneController>(
      () => LetsredneController(),
    );
  }
}
