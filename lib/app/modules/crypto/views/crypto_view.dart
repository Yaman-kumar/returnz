import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:returnz/app/modules/chart.dart';
import 'package:returnz/app/modules/localauth/controllers/localauth_controller.dart';
import 'package:returnz/app/modules/navbar/controllers/navbar_controller.dart';
import 'package:returnz/services/colors.dart';
import 'package:returnz/services/responsive.dart';

import '../controllers/crypto_controller.dart';

class CryptoView extends GetView<CryptoController> {
  NavbarController controllerNav = Get.find<NavbarController>();
  @override
  Widget build(BuildContext context){
    //Get.find<LocalauthController>();
    return Obx(() =>
    Scaffold(
        body: controllerNav.data.value.data == null ? Center(
          child: CircularProgressIndicator(
            color: Color(0xffD8F336),
          ),
        ) : SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Column(
              children: [
                 SizedBox(height: 10.h,),
                Container(
                  padding: EdgeInsets.all(30),
                  height: 153.kh,
                  width: 340.kw,
                  decoration: BoxDecoration(
                    color: ColorUtil.kMainContainer,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Realized Gain',
                            style: TextStyle(
                              fontSize: 22.27.kh,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF6A723A),
                            ),
                          ),
                          Text(
                            '\$0.00',
                            style: TextStyle(
                              fontSize: 34.41.kh,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '+0.0%',
                            style: TextStyle(
                              color: Color(0xFF20D774),
                              fontSize: 16.kh,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Container(
                            height: 30.kh,
                            width: 80.kw,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(20)),
                                color: Color(0xFFEFF8BC)),
                            child: Center(
                              child: Text(
                                '#4 Trades',
                                style: TextStyle(
                                  fontSize: 16.kh,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                StocksPage(),
                Padding(
                  padding : EdgeInsets.only(bottom: 1,top: 0,left: 25.0,right: 25.0),
                  child   : Row(
      mainAxisAlignment   : MainAxisAlignment.spaceBetween,
               children   : [
                      Text('Closed Positions',style: TextStyle(
                        fontSize: 18.kh,
                        fontWeight: FontWeight.bold,
                      ),),
                  TextButton(
                    onPressed: (){

                      Get.bottomSheet(
                        Container(
                            height: 400.kh,
                            color: Colors.white,
                            child:Column(
                              children: [
                  Text("Enter You MPIN"),
                              ],
                            )
                        ),
                       // barrierColor: Colors.red[50],
                       // isDismissible: false,
                      );
                    },
                        child: Text('See all',
                          style: TextStyle(
                            decoration: TextDecoration.underline,

                            fontSize: 16.kh,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: double.infinity,
                  height: 450,
                  child: ListView.builder(
                      itemCount: controllerNav.data.value.data?.length,
                      itemBuilder: (snapshot,index){
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.all(15),
                        height: 98.kh,
                        width: 350.kw,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade200,
                              offset: Offset(0.0, 0.1), //(x,y)
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  children: [
                                    // CircleAvatar(
                                    //   backgroundColor: Color(0xFFE3DEDE),
                                    // ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: '${controllerNav.data.value.data?[index]?.balance?.currency}\n',
                                        style: TextStyle(
                                          color: Color(0xFF676767),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '${controllerNav.data.value.data?[index]?.name}',
                                              style: TextStyle(
                                                  fontSize: 18.kh,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        text: 'QTY',
                                        style: TextStyle(
                                          color: Color(0xFF676767),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '  25',
                                              style: TextStyle(
                                                  fontSize: 11.kh,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                        text: 'AVG',
                                        style: TextStyle(
                                          color: Color(0xFF676767),
                                        ),
                                        children: <TextSpan>[
                                          TextSpan(
                                              text: '  \$126.78',
                                              style: TextStyle(
                                                  fontSize: 11.kh,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${controllerNav.data.value.data?[index]?.balance?.amount}',
                                  style: TextStyle(
                                    fontSize: 24.kh,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  height: 24.kh,
                                  width: 140.kw,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFDEFEEC),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '145.86 USD(+0.22%)',
                                      style: TextStyle(color: Color(0xFF059045)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ) ;
                  }),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


