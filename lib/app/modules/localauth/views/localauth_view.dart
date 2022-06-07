import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:returnz/app/routes/app_pages.dart';
import 'package:returnz/services/local_auth_api.dart';
import 'package:returnz/services/responsive.dart';
import 'package:returnz/widget/button.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../controllers/localauth_controller.dart';

class LocalauthView extends GetView<LocalauthController> {
  @override
  Widget build(BuildContext context) {
    Get.find<LocalauthController>();
    return Scaffold(
      body: Obx(
        () => controller.state.value == false
            ? WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl: controller.authorizationUrl.value.toString(),
                navigationDelegate: (navReq) {
                  print("Nav ${navReq.url}");
                  if (navReq.url.startsWith("https://my.app//oauth2redirect")) {
                    controller.responseUrl.value = Uri.parse(navReq.url);
                    controller.state.value = true;

                    print("${controller.responseUrl.value}".substring(36));
                    controller.makePostRequest_follow(
                        "${controller.responseUrl.value}".substring(36));
                    //  return NavigationDecision.navigate;
                  }
                  print(NavigationDecision.navigate.index);
                  return NavigationDecision.navigate;
                },
              )
            : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 45.0),
                    child: Image(
                        height: 180.kh,
                       // width: 250.kw,
                        image: AssetImage("assets/images/coinbaseConnect.png")),
                  ),
                  Text("Coinbase has been Connect to returnz Account",style: TextStyle(

                    fontSize: 18.kh,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(
                    height: 15.h,
                  ),
                  SizedBox(
                    width: 250.kw,
                    child: big_button_SignUP(
                      Name: 'Continue',
                      Route: () {
                        Get.offAndToNamed(Routes.NAVBAR);
                            print(controller.responseUrl.value);
                      },
                    ),
                  ),
                  // TextButton(
                  //   onPressed:(){
                  //     Get.toNamed(Routes.NAVBAR);
                  //     print(controller.responseUrl.value);
                  //   },
                  //
                  //   child: Text("${controller.responseUrl.value}"),
                  // )
                ],
              ),
            ),
      ),
    );

    // return   Scaffold(
    //
    //    body: Center(
    //
    //    )
    //   //  Center(
    //   //    child: TextButton(
    //   //      onPressed: ()async {
    //   //        final isAuthenticated = await LocalAuthApi.authenticate();
    //   //        if (isAuthenticated) {
    //   //          Get.toNamed(Routes.NAVBAR);
    //   //        }else{
    //   //          print("Not authenticated");
    //   //        }
    //   //      },
    //   // child :  Text('LocalauthView is working',
    //   //      style: TextStyle(fontSize: 20),),
    //   //    ),
    //   //  ),
    //  );
  }
}
