import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:returnz/app/routes/app_pages.dart';

class OnboardingController extends GetxController {

  //TODO: Implement OnboardingController
  final storage = new FlutterSecureStorage();
  final access_token = ''.obs;

  tokenGet()async{
    access_token.value = (await storage.read(key: "access"))!;
  }


  final count = 0.obs;
  @override
  void onInit() {
    tokenGet();
    super.onInit();
  }

  @override
  void onReady() {
  //  tokenget();
   // print("Token : ${token.value}");
    // if(tokenOrEmpty == null){
    //   Get.toNamed(Routes.ONBOARDING);
    // }else{
    //   Get.toNamed(Routes.NAVBAR);
    //
    // }
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
