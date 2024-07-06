import 'package:get/get.dart';

import '../modules/letmalo/bindings/letmalo_binding.dart';
import '../modules/letmalo/views/letmalo_view.dart';
import '../modules/letmnogo/bindings/letmnogo_binding.dart';
import '../modules/letmnogo/views/letmnogo_view.dart';
import '../modules/letsredne/bindings/letsredne_binding.dart';
import '../modules/letsredne/views/letsredne_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/razrab/bindings/razrab_binding.dart';
import '../modules/razrab/views/razrab_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/spravka/bindings/spravka_binding.dart';
import '../modules/spravka/views/spravka_view.dart';

// import '../modules/history/bindings/history_binding.dart';
// import '../modules/history/views/history_view.dart';
// import '../modules/registration/bindings/registration_binding.dart';
// import '../modules/registration/views/registration_view.dart';
// import '../modules/test/bindings/test_binding.dart';
// import '../modules/test/views/test_view.dart';
// import '../modules/viborzad/bindings/viborzad_binding.dart';
// import '../modules/viborzad/views/viborzad_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.MAIN;

  static final routes = [
    // GetPage(
    //   name: _Paths.REGISTRATION,
    //   page: () => RegistrationScreen(),
    //   binding: RegistrationScreenBinding(),
    // ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainScreen(),
      binding: MainBinding(),
    ),
    // GetPage(
    //   name: _Paths.HISTORY,
    //   page: () => HistoryScreen(),
    //   binding: HistoryBinding(),
    // ),
    // GetPage(
    //   name: _Paths.VIBORZAD,
    //   page: () => CategorySelectionScreen(),
    //   binding: ViborzadBinding(),
    // ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    // GetPage(
    //   name: _Paths.TEST,
    //   page: () => TestScreen(),
    //   binding: TestBinding(),
    // ),
    GetPage(
      name: _Paths.SPRAVKA,
      page: () => const SpravkaView(),
      binding: SpravkaBinding(),
    ),
    GetPage(
      name: _Paths.RAZRAB,
      page: () => const RazrabView(),
      binding: RazrabBinding(),
    ),
    GetPage(
      name: _Paths.LETMALO,
      page: () => const LetmaloView(),
      binding: LetmaloBinding(),
    ),
    GetPage(
      name: _Paths.LETSREDNE,
      page: () => const LetsredneView(),
      binding: LetsredneBinding(),
    ),
    GetPage(
      name: _Paths.LETMNOGO,
      page: () => const LetmnogoView(),
      binding: LetmnogoBinding(),
    ),
  ];
}
