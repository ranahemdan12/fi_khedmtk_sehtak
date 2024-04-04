import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';


class CustomCartText2 extends StatelessWidget {
  CustomCartText2({Key? key,
    required this.text1,required this.text2}) : super(key: key);


  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text1,
          style:  GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.blackColor,
          ),

        ),
        SizedBox(width: 3.w,),
       Image.asset(AssetManger.coinIcon),
        Text(text2,
          style:  GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.redColor,
          ),

        ),
        SizedBox(width: 2.w,),
        SvgPicture.asset(AssetManger.plusIcon),


      ],
    );

    //  Text(
    //  StringManger.noCart,

    // ),
  }
}