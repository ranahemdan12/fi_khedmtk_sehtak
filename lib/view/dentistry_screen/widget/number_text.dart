import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class NumberServiceText extends StatelessWidget {
  const NumberServiceText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(StringManger.numOfServices, style: GoogleFonts.montserrat(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: ColorManger.greyItemColor,
    ),);
  }
}
