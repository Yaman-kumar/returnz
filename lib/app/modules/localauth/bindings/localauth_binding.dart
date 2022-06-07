import 'package:get/get.dart';

import '../controllers/localauth_controller.dart';

class LocalauthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LocalauthController>(
      () => LocalauthController(),
    );
  }
}
