import 'package:flutter/material.dart';
import 'package:returnz/services/colors.dart';
import 'package:returnz/services/responsive.dart';

class TextStyleUtil {
  final Color color;
  final double fontsize;
  final FontWeight fontWeight;

  TextStyleUtil({
    this.color = Colors.white,
    this.fontsize = 24,
    this.fontWeight = FontWeight.w600,
  });

  static TextStyle textNimbusSanLStyleS14Wregular({
    //NimbusSanL
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return TextStyle(
      color: color,
      fontSize: 14.kh,
      fontWeight: fontWeight,
      fontFamily: 'NimbusSanL',
    );
  }

  static TextStyle textSFPROStyleS30Wbold({
    Color color = Colors.black,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(

      color: color,
      fontSize: 30.kh,
      fontWeight: fontWeight,
     // fontFamily: 'SF Pro Display Regular',
    );
  }

  static TextStyle textSFPROStyleS16Wbold({
    Color color = ColorUtil.kgrey,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(

      color: color,
      fontSize: 16.kh,
      fontWeight: fontWeight,
      //fontFamily: 'SF Pro Display Regular',
    );
  }


  static TextStyle textSFPROStyleS16W400({
    Color color = ColorUtil.kfadeblack,
    FontWeight fontWeight = FontWeight.w400,
  }) {
    return TextStyle(

      color: color,
      fontSize: 16.kh,
      fontWeight: fontWeight,
     // fontFamily: 'SF Pro Display Regular',
    );
  }

  static TextStyle textSFPROStyleS8W600({
    Color color = ColorUtil.kprimaryblack,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(

      color: color,
      fontSize: 18.kh,
      fontWeight: fontWeight,
      // fontFamily: 'SF Pro Display Regular',
    );
  }
  static TextStyle textSFPROStyleS18W500({
    Color color = ColorUtil.kprimaryblack,
    FontWeight fontWeight = FontWeight.w500,
  }) {
    return TextStyle(

      color: color,
      fontSize: 18.kh,
      fontWeight: fontWeight,
      // fontFamily: 'SF Pro Display Regular',
    );
  }

  static TextStyle textSFPROStyleButtonText({
    Color color = ColorUtil.kprimaryblack,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(

      color: color,
      fontSize: 18.kh,
      fontWeight: fontWeight,
      // fontFamily: 'SF Pro Display Regular',
    );
  }


  static TextStyle textSFPROStyleButtonTextSunderline({
    Color color = ColorUtil.kprimaryblack,
    FontWeight fontWeight = FontWeight.w600,
  }) {
    return TextStyle(
decoration: TextDecoration.underline,
      color: color,
      fontSize: 16.kh,
      fontWeight: fontWeight,
      // fontFamily: 'SF Pro Display Regular',
    );
  }
}