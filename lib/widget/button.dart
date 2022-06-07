import 'package:flutter/material.dart';
import 'package:returnz/services/colors.dart';
import 'package:returnz/services/responsive.dart';
import 'package:returnz/services/textstyles.dart';


class big_button_SignUP extends StatelessWidget {
  final  Name;
  final  Route;
  const big_button_SignUP({Key? key,required this.Name,required this.Route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.kw,
      height: 64.kh,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        color: ColorUtil.kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: TextButton(
        onPressed:Route,
        child: Center(child: Text(Name,style: TextStyleUtil.textSFPROStyleButtonText(),)),
      ),
    );
  }
}


class big_button_Icon extends StatelessWidget {
  final  Name;
  final  Route;
  final icons;
  const big_button_Icon({Key? key,required this.Name,required this.Route,required this.icons}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382.kw,
      height: 64.kh,
      padding: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        border:
            Border.all(color: ColorUtil.kprimaryblack),
       // color: ColorUtil.kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
             icons,
          ),
          TextButton(
            onPressed:Route,
            child: Center(child: Text(Name,style: TextStyle(
              fontSize: 18.kh,
              fontWeight: FontWeight.w500,
              color: ColorUtil.kprimaryblack,
            ),)),
          ),
        ],
      ),



    );
  }
}
