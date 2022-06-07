import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/services/responsive.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
     Get.find<SplashController>();
    return
      Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: Image(
              width: 159.kw,
              height: 196.kh,
              image: AssetImage("assets/images/ReturnZlogo.png"),
            ),
          ));

  }
}
