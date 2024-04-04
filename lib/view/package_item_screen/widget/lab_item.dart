import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class LabItem extends StatelessWidget {
  const LabItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163.w,
      height: 150.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManger.blueColor,
          width: 1.w,
        ),
      ),
      child: Column(children: [
        SizedBox(height: 4.h,),
        Image.asset(AssetManger.labIcon,
        width: 70.w,
        height: 70.h,),
        SizedBox(height:4.h,),
        Text(StringManger.speedLab,

          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color:ColorManger.blackColor ,
          ),
        ),
        SizedBox(height: 4.h,),
       RichText( text: TextSpan(
         text:    StringManger.eGP,
          style: GoogleFonts.montserrat(
         fontSize: 10.sp,
         fontWeight: FontWeight.w500,
         color:ColorManger.redColor ,
        ),
         children: [
           TextSpan(text: StringManger.insteadOf, style: GoogleFonts.montserrat(
         fontSize: 10.sp,
         fontWeight: FontWeight.w500,
         color:ColorManger.blackColor ,
       ),),
           TextSpan(text: StringManger.rEgp,
             style: GoogleFonts.montserrat(
               fontSize: 10.sp,
               fontWeight: FontWeight.w500,
               color:ColorManger.blueColor ,
             ),),

         ],
       ),),

      ],)
    );
  }
}