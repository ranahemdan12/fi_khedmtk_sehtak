import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class ScanContainer extends StatelessWidget {
  ScanContainer({Key? key,
    required this . svgPic,
    required this . text,
     this . textT,
    this.onTab,
    this.onTab2,

  }) : super(key: key);
  String svgPic;
  String text;
  String?textT;
  void Function()? onTab;
  void Function()? onTab2;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      height: 70.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: ColorManger.blueCColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child:ListTile(
        minLeadingWidth: 0,
        titleAlignment: ListTileTitleAlignment.center,
        leading:SvgPicture.asset(svgPic,
        fit: BoxFit.scaleDown,) ,
        title:GestureDetector(
          onTap: onTab2,
          child: Text(   text,
          style: GoogleFonts.montserrat(
          fontSize: 14.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.blueColor,
          ),),
        ) ,
        trailing:GestureDetector(
          onTap:onTab ,
          child: Text(   textT?? '',
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.redColor,
            ),),
        ) ,



      ),

    );
  }
}
