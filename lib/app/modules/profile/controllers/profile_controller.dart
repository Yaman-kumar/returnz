import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  var name = ''.obs;
  var phone = ''.obs;

  printName() async {
    name.value = (await firebaseAuth.currentUser!.email)! ;
    phone.value = (await firebaseAuth.currentUser!.phoneNumber)! ;

  }
  final count = 0.obs;
    @override
    void onInit() {

      super.onInit();
    }

    @override
    void onReady() {
      print("asd asd  ${name.value}");
      printName();
      super.onReady();
    }

    @override
    void onClose() {}
    //void increment() => count.value++;
  }
