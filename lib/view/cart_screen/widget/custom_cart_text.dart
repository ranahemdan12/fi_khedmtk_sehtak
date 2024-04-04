import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';


class CustomCartText extends StatelessWidget {
  CustomCartText({Key? key,
    required this.text1,required this.text2}) : super(key: key);


  String text1;
  String text2;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text:text1,
        style:  GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.blackColor,
        ),
        children: [
          TextSpan(text: text2, style:  GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.labelGrayColor,
          ),),

        ],
      ),
    );

    //  Text(
    //  StringManger.noCart,

    // ),
  }
}
