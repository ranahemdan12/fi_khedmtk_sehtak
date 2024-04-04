import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/color_manger.dart';

class ResultItem extends StatelessWidget {
  ResultItem({Key? key,
    required this.text,
    required this.svgImage,
  }) : super(key: key);

  String text;
  String svgImage;

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      SvgPicture.asset(svgImage),
      SizedBox(height: 6.h,),
      Text(text,
        style: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.labelGrayColor,
        ),),
    ],);
  }
}
