import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:returnz/app/routes/app_pages.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  final FirebaseAuth auth = FirebaseAuth.instance;

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
    super.onReady();
    print("User : ${auth.currentUser}");

    Future.delayed(Duration(seconds: 1), () {

      if(access_token.value == '' && auth.currentUser == null){
        Get.toNamed(Routes.LOGIN);
      }else if(auth.currentUser != null){

        Get.toNamed(Routes.NAVBAR);
      }


    });
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
