import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:returnz/app/modules/crypto/views/crypto_view.dart';
import 'package:returnz/app/modules/localauth/controllers/localauth_controller.dart';
import 'package:returnz/app/modules/notification/views/notification_view.dart';
import 'package:returnz/app/modules/onboarding/views/onboarding_view.dart';
import 'package:returnz/app/modules/profile/views/profile_view.dart';
import 'package:returnz/app/modules/stocks/views/stocks_view.dart';
import 'package:returnz/services/colors.dart';

import '../controllers/navbar_controller.dart';

class NavbarView extends GetView<NavbarController> {
  @override
  Widget build(BuildContext context) {
    //Get.find<LocalauthController>();
    Get.find<NavbarController>();
    return GetBuilder<NavbarController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                CryptoView(),
                NotificationView(),
                ProfileView(),
              ],
            ),

          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            selectedItemColor: Color(0xffD8F336),
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 1,
            items: [
              _bottomNavigationBarItem(
                activeicon: 'assets/SVG/dbActive.svg',
                icon: 'assets/SVG/d.svg',
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                activeicon: 'assets/SVG/bellActive.svg',

                icon: 'assets/SVG/n.svg',
                label: 'Alerts',
              ),
              _bottomNavigationBarItem(
                activeicon: 'assets/SVG/profileActive.svg',

                icon: 'assets/SVG/p.svg',
                label: 'Account',
              ),
            ],
          ),
        );
      }
    );

}

_bottomNavigationBarItem({required  icon, required String label,required activeicon}) {
  return BottomNavigationBarItem(
    icon: SvgPicture.asset(
        icon,
     // color: Colors.red,
    ),
    activeIcon: SvgPicture.asset(
      activeicon,
      //color: Color(0xffD8F336),
    ),
    label: label,
  );
}


}
