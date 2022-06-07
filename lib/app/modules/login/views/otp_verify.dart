import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/app/modules/login/controllers/login_controller.dart';
import 'package:returnz/services/responsive.dart';
import 'package:returnz/services/textstyles.dart';
import 'package:returnz/widget/button.dart';
import 'package:returnz/widget/input.dart';
import 'package:returnz/widget/social_button.dart';


import 'package:returnz/app/routes/app_pages.dart';

class OtpVerify extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: Column(
         // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'OTP verification',
              style: TextStyleUtil.textSFPROStyleS30Wbold(),
            ),
            SizedBox(
              height: 2.h,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(

                  '4 digit verification is sent to an \n +01 1521 25624',
              textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            MakeInput(
              hintText: 'Enter OTP',
              obscureText: false,
              label: '',
            ),
            SizedBox(
              height: 3.h,
            ),
            big_button_SignUP(
              Name: 'Verify',
              Route: () {
                Get.toNamed(Routes.HOME);
              },
            ),

            SizedBox(height: 3.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Didn’t receive any code?',style: TextStyleUtil.textSFPROStyleS16W400(),),

                TextButton(
                    onPressed: (){
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: Text("Resend",style: TextStyleUtil.textSFPROStyleButtonTextSunderline(),)),

              ],
            ),
          ],
        ),
      ),
    );
  }


}


