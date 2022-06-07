import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:returnz/app/modules/localauth/controllers/localauth_controller.dart';
import 'package:returnz/app/routes/app_pages.dart';
import 'package:returnz/services/strings.dart';
import 'package:returnz/services/textstyles.dart';
import '../controllers/onboarding_controller.dart';
import 'package:returnz/services/responsive.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  Widget build(BuildContext context) {
    //Get.put(LocalauthController());
    Get.find<OnboardingController>();
    Get.put(OnboardingController());
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
                height: 104.kh,
                width: 146.kw,
                image: AssetImage('assets/images/ReturnZlogo.png')),
            SizedBox(
              height: 7.h,
            ),
            Text(
              Strings.ksWelcomeMsg1,
              textAlign: TextAlign.center,
              style: TextStyleUtil.textSFPROStyleS30Wbold(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
             Strings.ksWelcomeMsg2,
              textAlign: TextAlign.center,
              style: TextStyleUtil.textSFPROStyleS16Wbold(),
            ),
            SizedBox(
              height: 10.h,
            ),
            GestureDetector(
              onTap: () {
                print(controller.access_token.value);
                if(controller.access_token.value == ''){
                  Get.toNamed(Routes.LOGIN);
                }else{
                  Get.toNamed(Routes.NAVBAR);
                }
              },
              child: Image(
                  height: 96.kh,
                  width: 96.kw,
                  image: AssetImage('assets/images/ButtonRound.png')),
            ),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
