import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class JoinText extends StatelessWidget {
  const JoinText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(
      StringManger.joinedUs,
      style: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        color: ColorManger.blackColor,
      ),
    );
  }
}
