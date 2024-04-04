import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
class PrescriptionItem extends StatelessWidget {
  PrescriptionItem({Key? key,
    required this.text,
    required this.svgPic,

  }) : super(key: key);

  String text;
  String svgPic;

  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      SvgPicture.asset(svgPic),
      SizedBox(height: 6.h,),
      Text(text,
        style: GoogleFonts.montserrat(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.labelGrayColor,
        ),),
    ],);
  }
}