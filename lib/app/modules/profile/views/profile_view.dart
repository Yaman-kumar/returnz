import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:returnz/app/routes/app_pages.dart';
import 'package:returnz/services/api_service.dart';
import 'package:returnz/services/colors.dart';
import 'package:returnz/services/textstyles.dart';

import '../controllers/profile_controller.dart';
import'package:returnz/services/responsive.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return Scaffold(

      body: Obx(()=>
      Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            children: [
              SizedBox(
                height: 3.h,
              ),
              Row(
                children: [

                  Container(
                    height: 55.kw,
                    width: 55.kh,
                    decoration:BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/profileImage.png'),
                      )
                    ),

                  ),
                  SizedBox(width: 4.w,),
                  Column(
                    //mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${controller.name.value}',style: TextStyleUtil.textSFPROStyleS8W600(),
                      ),

                      SizedBox(height: 4.kh,),
                      Text('${controller.phone.value}',style: TextStyleUtil.textSFPROStyleS16W400(),),
                    ],
                  ),

                ],
              ),
              SizedBox(
                height: 4.h,
              ),
              profile_elements(
                text: 'Profile setting',
                icon: '1.svg',
              ),
              profile_elements(
                text: 'Security',
                icon: '2.svg',
              ),

              profile_elements(
                text: 'Saved report',
                icon: '3.svg',
              ),
              profile_elements(
                text: 'Custom report',
                icon: '4.svg',
              ),
              profile_elements(
                text: 'Notification settings',
                icon: '5.svg',
              ),
              GestureDetector(
               onTap:  (){
                  storage.delete(key: "access");
                  Get.deleteAll();
                  Get.offAndToNamed(Routes.ONBOARDING);

               },
                child: profile_elements(
                  text: 'Logout',
                  icon: 'Logout.svg',
                  Color: Colors.red,
                ),
              ),

              Container(
                height: 110.kh,
                width: 330.kw,
                decoration: BoxDecoration(
                  color: Color(0xffF0FAB2),
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        "assets/SVG/headphone.svg",
                        width: 34.kw,
                        height: 34.kh,
                        color: Colors.black,
                      ),
SizedBox(width: 3.w,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Feel free to ask, we are ready to help',style: TextStyleUtil.textSFPROStyleS16W400(),),
                          Text('help@returnz.com',style: TextStyleUtil.textSFPROStyleS18W500(),),

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}



class profile_elements extends StatelessWidget {
  final String text;
  final icon;
  final Route;
  final Color;

  const profile_elements(
      {Key? key, this.Route, required this.text, required this.icon , this.Color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: TextButton(
        onPressed: Route,
        //     (){aaasdx
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(builder: (context) => Route),
        //   );
        // },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40.kh,
                  width: 40.kw,
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/SVG/${icon}",
                      width: 24.kw,
                      height: 24.kh,
                      color: Color == null ? ColorUtil.kPrimaryColor : Color,
                    ),
                  ),
                  // Icon(
                  //   icon,
                  //   color: Colors.white,
                  //   size: 20,ds
                  // ),
                ),
                SizedBox(width: 4.w),
                Text(
                  text,
                  style: TextStyle(


                    color:Color == null ? ColorUtil.kprimaryblack :Color,
                    fontSize: 18.kh,
                    fontWeight: FontWeight.w500,
                  ),
                    //Util.textSFPROStyleS18W500(),
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color:Color == null ? Colors.black : Color,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
