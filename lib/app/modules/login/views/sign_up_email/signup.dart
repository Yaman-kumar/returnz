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

class SignUpViewEmail extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<authController>();

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
                'Welcome to Returnz',
                style: TextStyleUtil.textSFPROStyleS30Wbold(),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                'Sign Up to your App using E-mail Address',
                style: TextStyleUtil.textSFPROStyleS16W400(),
              ),
              SizedBox(
                height: 5.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Name'),
              ),
              SizedBox(
                height: 1.h,
              ),
              MakeInput(
                controllerID: controller.nameController.value,
                hintText: 'Enter your Name',
                obscureText: false,
                label: '',
              ),
              SizedBox(
                height: 3.h,
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
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Password'),
              ),
              SizedBox(
                height: 1.h,
              ),
              MakeInput(
                controllerID: controller.passwordController.value,
                hintText: 'Password',
                obscureText: true,
                label: '',
              ),
              SizedBox(
                height: 3.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text('Confirm Password'),
              ),
              SizedBox(
                height: 1.h,
              ),
              MakeInput(
                controllerID: controller.confirmPasswordController.value,
                hintText: 'Confirm Password',
                obscureText: true,
                label: '',
              ),
              SizedBox(
                height: 4.h,
              ),
              big_button_SignUP(
                Name: 'SignUp',
                Route: () {
                  if (controller.passwordController.value.text ==
                      controller.confirmPasswordController.value.text) {
                    auth.registerUsingEmailPassword(
                      password: controller.passwordController.value.text,
                      email: controller.emailController.value.text,
                    );
                  } else {
                    Get.snackbar(
                        "Error", "Password does not match");
                  }
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
                icons: Icons.mail,
                Route: () {
                  Get.offAllNamed(Routes.LOGINEMAIL);
                },
                Name: 'SignUp using Phone',
              ),
              SizedBox(
                height: 4.h,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialAuthButton(
                      image: 'assets/images/apple.png',
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SocialAuthButton(
                      image: 'assets/images/google.png',
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    SocialAuthButton(
                      image: 'assets/images/facebook.png',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 3.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyleUtil.textSFPROStyleS16W400(),
                  ),
                  TextButton(
                      onPressed: () {

                       // Get.offAllNamed(Routes.LOGIN);
                      },
                      child: Text(
                        "Login",
                        style:
                            TextStyleUtil.textSFPROStyleButtonTextSunderline(),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
