import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/services/responsive.dart';

import '../controllers/notification_controller.dart';

class NotificationView extends GetView<NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 8.h,),

          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0,right: 20.0),
                child: Container(
                  height: 55.kh,
                  width: 55.kw,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      scale: 5,
                      image: AssetImage(
                        'assets/images/CoinInHand.png'
                      )
                    ),
color: Color(0xFFE6EDE4),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('\"\$APPL- Profit of \$620! Nice Work!\"',style: TextStyle(
                      fontSize: 14.kh,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 12.kh,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('26 April 2021',style: TextStyle(
                        fontSize: 12.kh,
                        color: Color(0xff6B5050)
                      ),),
SizedBox(width: 14.h,),
                    Text('12:53 PM',style: TextStyle(
    fontSize: 12.kh,
    color: Color(0xff6B5050)
),),
                    ],
                  ),
                ],
              ),
            ],
          ),

          ],
        ),
      ),
    );
  }
}
