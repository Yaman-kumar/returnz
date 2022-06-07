import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:returnz/app/modules/crypto/views/crypto_view.dart';
import 'package:returnz/app/routes/app_pages.dart';
import 'package:returnz/models/CoinbasePortfilio.dart';
import 'package:returnz/services/ApiRepo.dart';
import 'package:returnz/services/api_service.dart';
import 'package:returnz/services/local_auth_api.dart';
import 'package:returnz/services/responsive.dart';

class NavbarController extends GetxController {
  //TODO: Implement NavbarController
  var tabIndex = 0;
  final count = 0.obs;
   var data = SomeRootEntity().obs;
  final realisedGain = 0.obs;
  checkAuth() async{
    print("checking Auth");
    final isAuthenticated = await LocalAuthApi.authenticate();
    if (isAuthenticated) {
      Get.toNamed(Routes.NAVBAR);
    }else{
      Get.toNamed(Routes.ONBOARDING);
      Get.delete<NavbarController>();
      print("Not authenticated");
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkAuth();
    Dio();
  }

  @override
  void onReady() async{
   // bottomsheet();
    super.onReady();
    data.value = await APIManager().makePostRequest_follow();
  //  for(int i = 0 ; i<= data.value.data.first.)
  }

  @override
  void changeTabIndex(int index) {
    tabIndex = index;
    update();
    
  }
}
