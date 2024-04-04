import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class TimeSoltText extends StatelessWidget {
  const TimeSoltText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 24),
      child: Text(StringManger.timeSlot,
        style: GoogleFonts.montserrat(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorManger.blackColor,
        ),

      ),
    );
  }
}