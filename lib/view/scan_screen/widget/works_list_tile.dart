import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class WorksListTile extends StatelessWidget {
  WorksListTile({Key? key,
    required this . svgPic,
    required this . text,
    required this . textT,
  }) : super(key: key);


  String svgPic;
  String text;
  String textT;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minLeadingWidth: 0,
      titleAlignment: ListTileTitleAlignment.center,
      leading:SvgPicture.asset(svgPic,
        fit: BoxFit.scaleDown,) ,
      title:Text(   text,
        style: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.blackColor,
        ),) ,
      subtitle:Text(   textT,
        style: GoogleFonts.montserrat(
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.labelGrayColor,
        ),) ,




    );
  }
}
