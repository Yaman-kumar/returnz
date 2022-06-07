import 'package:get/get.dart';
import 'package:returnz/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:returnz/auth/auth_controller.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<authController>(
          () => authController(),
    );
    Get.lazyPut<NavbarController>(
          () => NavbarController(),fenix: true
    );
  }
}
