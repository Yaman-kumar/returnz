// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:returnz/services/colors.dart';
import 'package:returnz/services/responsive.dart';

class MakeInput extends StatelessWidget {
  final String label;
  final enabled;
  final bool obscureText;
  final String hintText;
  final  controllerID;
  //TextEditingController
  MakeInput({required this.hintText,required this.label, required this.obscureText, this.controllerID, this.enabled = true});
  @override
  Widget build(BuildContext context) {
    return TextFormField(

      enabled: enabled,
      validator:  (value) {
        if (value == null || value.isEmpty) {
          return 'Please fill the empty text fields';
        }
      },
      controller: controllerID,
      obscureText: obscureText,
      style: TextStyle(color: ColorUtil.kprimaryblack),
      decoration: InputDecoration(

        fillColor: ColorUtil.kTextField,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 16,
          color: ColorUtil.kprimaryblack,

        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 25.0,
          horizontal: 20.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtil.kPrimaryColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorUtil.kTextField,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),

        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),

        ),
      ),
    );
  }
}

