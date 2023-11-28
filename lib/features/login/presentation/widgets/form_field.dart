import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/colors.dart';

Widget defaultFormField(
    {required TextEditingController controller,
      required String label,
      required Widget givenIcon,
      bool isPassword = false}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
          filled: true,
          prefixIcon: givenIcon,
          prefixIconColor:AppColors.secondry,
          fillColor: Colors.white,
          hintText: label,
          hintStyle:  TextStyle(
            fontFamily: 'CircularStd',
                color: AppColors.secondry,
                fontSize: 14.sp,
                fontWeight: FontWeight.normal
          ),
          enabledBorder: OutlineInputBorder(
              borderSide:  const BorderSide(color: AppColors.grey, width: 1.0),
              borderRadius: BorderRadius.circular(6))),
    );