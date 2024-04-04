import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FrameContainer extends StatelessWidget {
   FrameContainer({Key? key,
  required this.text,}) : super(key: key);

   String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManger.whiteColor,
        border: Border.all(
          color: ColorManger.blueDColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 8,vertical: 10),
        child: Text( text,

        style: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManger.labelGrayColor,
        ),
        ),
      ),
    );
  }
}
