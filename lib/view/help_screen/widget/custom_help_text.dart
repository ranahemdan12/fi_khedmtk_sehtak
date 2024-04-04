import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class HelpText extends StatelessWidget {
   HelpText({Key? key,
  required this.text,}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: ColorManger.blueColor,
      ),

    );
  }
}
