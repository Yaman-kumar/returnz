import 'package:get/get.dart';
import 'package:returnz/app/modules/crypto/controllers/crypto_controller.dart';
import 'package:returnz/app/modules/home/controllers/home_controller.dart';
import 'package:returnz/app/modules/localauth/controllers/localauth_controller.dart';
import 'package:returnz/app/modules/onboarding/controllers/onboarding_controller.dart';

import '../controllers/navbar_controller.dart';

class NavbarBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NavbarController>(() => NavbarController(),fenix: true);
    Get.lazyPut<CryptoController>(() => CryptoController(),fenix: true);
    Get.lazyPut<HomeController>(() => HomeController(),fenix: true);
    Get.lazyPut<LocalauthController>(()=> LocalauthController(),fenix: true);
    Get.lazyPut<OnboardingController>(() => OnboardingController(),fenix: true);
  }
}
