import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:returnz/app/routes/app_pages.dart';

class VerifyOtpController extends GetxController {
  //TODO: Implement VerifYotpController
  FirebaseAuth auth = FirebaseAuth.instance;
  final isEmailVerified = false.obs;
  final count = 0.obs;
  final loader = false.obs;
  late Timer timer;

  @override
  void onInit() {
    super.onInit();
    print("hello verification");
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    // if(!isEmailVerified.value){
    //   sendVerificationEmail();
    // }
    // if(isEmailVerified.value){
    //   Get.toNamed(Routes.SET_UP_PROFILE);
    // }

    timer = Timer.periodic(Duration(seconds: 3), (_) async {
      // print("sent");
      return await checkEmailVerified();
    });
  }

  Future sendVerificationEmail() async {
    try {
      loader.value = true;
      final user = FirebaseAuth.instance.currentUser;
      await user!.sendEmailVerification();
      loader.value = false;
    } catch (e) {
      print(e);
      loader.value = false;
      Get.snackbar("Error", "${e}");
    }
  }

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    isEmailVerified.value = FirebaseAuth.instance.currentUser!.emailVerified;
    if (isEmailVerified.value) {
      timer.cancel();
      Get.toNamed(Routes.LOCALAUTH);
    }
    ;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
  }

  void increment() => count.value++;
}
