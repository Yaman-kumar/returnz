import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/services/responsive.dart';
import 'package:returnz/services/textstyles.dart';
import 'package:returnz/widget/button.dart';
import 'package:returnz/widget/input.dart';
import 'package:returnz/widget/social_button.dart';

import '../../controllers/login_controller.dart';

import 'package:returnz/app/routes/app_pages.dart';

class SignUpViewPhone extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Welcome to Returnz',
              style: TextStyleUtil.textSFPROStyleS30Wbold(),
            ),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Sign Up to your App using Phone number',
              style: TextStyleUtil.textSFPROStyleS16W400(),
            ),
            SizedBox(
              height: 5.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text('Phone'),
            ),
            SizedBox(
              height: 1.h,
            ),
            MakeInput(
              hintText: 'Enter your Phone',
              obscureText: false,
              label: '',
            ),
            SizedBox(
              height: 3.h,
            ),
            big_button_SignUP(
              Name: 'SignUp',
              Route: () {
                Get.toNamed(Routes.OTP_VERIFY);
              },
            ),
            SizedBox(
              height: 3.h,
            ),
            Center(
              child: Text(
                'OR',
                style: TextStyleUtil.textSFPROStyleS16W400(),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            big_button_Icon(
              icons :Icons.mail,
              Route: () {
                Get.offAllNamed(Routes.SIGNUPEMAIL);
              },
              Name: 'SignUp using Email',
            ),
            SizedBox(
              height: 4.h,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0,right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  SocialAuthButton(image: 'assets/images/apple.png',),
                  SizedBox(width: 5.w,),
                  SocialAuthButton(image: 'assets/images/google.png',),
                  SizedBox(width: 5.w,),
                  SocialAuthButton(image: 'assets/images/facebook.png',),

                ],



              ),

            ),
            SizedBox(height: 3.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?',style: TextStyleUtil.textSFPROStyleS16W400(),),

                TextButton(
                    onPressed: (){
                      Get.offAllNamed(Routes.LOGIN);
                    },
                    child: Text("Login",style: TextStyleUtil.textSFPROStyleButtonTextSunderline(),)),

              ],
            ),
          ],
        ),
      ),
    );
  }


}


