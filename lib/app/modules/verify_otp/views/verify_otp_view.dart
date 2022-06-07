import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/app/routes/app_pages.dart';
import 'package:returnz/services/responsive.dart';

import '../controllers/verify_otp_controller.dart';

class VerifyOtpView extends GetView<VerifyOtpController> {
  @override
  Widget build(BuildContext context) {
    //Get.find<VerifYotpController>();
    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Obx(
              () => Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 35.kh,
              ),
              Text(
                "Verification E-mail Sent",
                // style:
                // TextStyleUtil.textMontserratStyleS17W700CPurple(),
              ),
              SizedBox(
                height: 24.kh,
              ),
              // Align(
              //   alignment: Alignment.centerRight,
              //   child: Row(
              //     children: [
              //       Checkbox(
              //         onChanged: (bool? value) {},
              //         value: false,
              //       ),
              //       Text("I accept the"),
              //       TextButton(
              //         onPressed: () {},
              //         child: Text(
              //           "Forgot Password?",
              //           style: TextStyleUtil
              //               .textMontserratStyleS14W700CDark_grey(),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 48.kh,
              ),
              controller.loader == true
                  ? Center(child: CircularProgressIndicator())
                  : TextButton(
                child: Text("Re-send"),
                onPressed: () async {
                  await controller.sendVerificationEmail();
                  // firebaseAuth.sendSignInLinkToEmail();
                },

              ),
              SizedBox(
                height: 10.kh,
              ),
              Center(
                child: TextButton(
                  child: Text(
                    "Change Email",
                    // style:
                    // TextStyleUtil.textMontserratStyleS17W600CBlack(
                    //   color: ColorUtil.primary_purple_1,
                    // ),
                  ),
                  onPressed: () {
                    Get.offAndToNamed(Routes.NAVBAR);
                   // firebaseAuth.signOut();
                  },
                ),
              ),
              SizedBox(
                height: 10.kh,
              ),
              SizedBox(
                height: 30.kh,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
