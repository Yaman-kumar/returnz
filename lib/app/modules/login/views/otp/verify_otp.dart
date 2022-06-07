import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/auth/auth_controller.dart';
import 'package:returnz/services/responsive.dart';
import 'package:returnz/services/textstyles.dart';
import 'package:returnz/widget/button.dart';
import 'package:returnz/widget/input.dart';
import 'package:returnz/widget/social_button.dart';

import '../../controllers/login_controller.dart';

import 'package:returnz/app/routes/app_pages.dart';



class VerifyOtpViews extends StatelessWidget {
  final String verificationId;
  final String phoneNumber;

   VerifyOtpViews({Key? key,required this.verificationId,required this.phoneNumber}) : super(key: key);

@override
  Widget build(BuildContext context) {
    authController auth = Get.find<authController>();
    LoginController controller = Get.find<LoginController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                'OTP Verification',
                style: TextStyleUtil.textSFPROStyleS30Wbold(),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Enter your otp',
                style: TextStyleUtil.textSFPROStyleS16W400(),
              ),
              // SizedBox(
              //   height: 5.h,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0),
              //   child: Text('Phone'),
              // ),
              SizedBox(
                height: 1.h,
              ),
              MakeInput(
                controllerID: controller.verifyController.value,
                hintText: 'OTP',
                obscureText: false,
                label: '',
              ),
              SizedBox(
                height: 3.h,
              ),
              big_button_SignUP(
                Name: 'Proceed',
                Route: () {
                  auth.verifyOTP(smsCode: controller.verifyController.value.text, verificationId: verificationId, phoneNumber: phoneNumber);
                  //print(controller.verifyController.value.text.trimLeft());
                //  Get.toNamed(Routes.HOME);
                },
              ),
              SizedBox(
                height: 3.h,
              ),
              // Center(
              //   child: Text(
              //     'OR',
              //     style: TextStyleUtil.textSFPROStyleS16W400(),
              //   ),
              // ),
              // SizedBox(
              //   height: 3.h,
              // ),
              // big_button_Icon(
              //   icons :Icons.mail,
              //   Route: () {
              //     Get.offAllNamed(Routes.LOGINEMAIL);
              //   },
              //   Name: 'Login using Email',
              // ),
              // SizedBox(
              //   height: 4.h,
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 8.0,right: 8),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //
              //     children: [
              //       SocialAuthButton(image: 'assets/images/apple.png',),
              //       SizedBox(width: 5.w,),
              //       SocialAuthButton(image: 'assets/images/google.png',),
              //       SizedBox(width: 5.w,),
              //       SocialAuthButton(image: 'assets/images/facebook.png',),
              //
              //     ],
              //
              //
              //
              //   ),
              //
              // ),
              // SizedBox(height: 3.h,),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Text('Don\'t have an account?',style: TextStyleUtil.textSFPROStyleS16W400(),),
              //
              //     TextButton(
              //         onPressed: (){
              //
              //           Get.offAllNamed(Routes.SIGNUPPHONE);
              //         },
              //         child: Text("Create an Account",style: TextStyleUtil.textSFPROStyleButtonTextSunderline(),)),
              //
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }


}


