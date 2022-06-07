import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/services/colors.dart';
import 'package:sizer/sizer.dart';

import 'app/routes/app_pages.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
  runApp(
    Sizer(
        builder: (context, orientation, deviceType){
        return GetMaterialApp(
          theme: ThemeData(
            backgroundColor: Color(0xffE5E5E5),
            primaryColor: ColorUtil.kPrimaryColor,
            fontFamily: 'SF Pro Display Regular',
          ),
          title: "Application",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
        );
      }
    ),
  );
}
