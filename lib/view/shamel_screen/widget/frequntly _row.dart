import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class FrequentlyRow extends StatelessWidget {
  const FrequentlyRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
      Text(StringManger.frequently,

      style: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorManger.redColor,
      ),),]

    );
  }
}
