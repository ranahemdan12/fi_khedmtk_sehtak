import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class RowWorks extends StatelessWidget {
  const RowWorks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(StringManger.howItWorks,

          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.blackColor,
          ),),
      ],
    );
  }
}
