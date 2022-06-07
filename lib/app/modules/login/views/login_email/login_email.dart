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

class LoginViewEmail extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    authController auth = Get.find<authController>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, top: 50),
          child: Obx(() =>
          Column(
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
                  'Login to your App using Email ID',
                  style: TextStyleUtil.textSFPROStyleS16W400(),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Email'),
                ),
                SizedBox(
                  height: 1.h,
                ),
                MakeInput(
                  controllerID: controller.emailController.value,
                  hintText: 'Enter your Email',
                  obscureText: false,
                  label: '',
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text('Password'),
                ),
                SizedBox(
                  height: 1.h,
                ),

                MakeInput(controllerID: controller.passwordController.value,

                  hintText: 'Enter your Password',
                  obscureText: true,
                  label: '',
                ),
                SizedBox(
                  height: 2.h,
                ),

                auth.LoginLoader.value == true ?Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ) : big_button_SignUP(
                  Name: 'Login',
                  Route: () {
                    auth.login(
                      controller.emailController.value.text,
                      controller.passwordController.value.text,
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                Center(
                  child: Text(
                    'OR',
                    style: TextStyleUtil.textSFPROStyleS16W400(),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                big_button_Icon(
                  icons: Icons.phone,
                  Route: () {
                    Get.offAllNamed(Routes.LOGIN);
                  },
                  Name: 'Login using Phone',
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
                    Text('Don\'t have an account?',style: TextStyleUtil.textSFPROStyleS16W400(),),

                    TextButton(
                        onPressed: (){
                          Get.offAllNamed(Routes.SIGNUPPHONE);
                        },
                        child: Text("Create an Account",style: TextStyleUtil.textSFPROStyleButtonTextSunderline(),)),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}


