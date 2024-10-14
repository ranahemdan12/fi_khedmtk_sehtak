
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

import '../../../../shared/resources/color_manger.dart';



class PinPutOtp extends StatelessWidget {
  const PinPutOtp({super.key, this.onCompleted, this.onChanged, this.length=6});
  final void Function(String)? onCompleted ;
  final void Function(String)? onChanged ;
  final int length ;


  @override
  Widget build(BuildContext context) {
    return Pinput(
      autofocus: true,
      length:length ,
      onCompleted:onCompleted ,
      onChanged: onChanged,
      submittedPinTheme: PinTheme(
          textStyle:Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorManger.blueColor),
          width: 43.w,
          height: 41.h,
          decoration: BoxDecoration(
              color:ColorManger.whiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                    color:  ColorManger.blueColor,
                  width: 1.w,
              )
          )
      ),
      focusedPinTheme:PinTheme(

          width: 43.w,
          height: 41.h,
          decoration: BoxDecoration(
              color:ColorManger.whiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color:  ColorManger.blueColor,
                width: 1.w,
              )
          )
      ),
      followingPinTheme: PinTheme(

          width: 43.w,
          height: 41.h,
          decoration: BoxDecoration(
              color:ColorManger.whiteColor,
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color:  ColorManger.blueColor,
                width: 1.w,
              )
          )
      ),
    );
  }
}
