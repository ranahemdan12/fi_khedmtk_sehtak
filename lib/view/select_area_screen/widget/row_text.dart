import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class RowText extends StatelessWidget {
  const RowText({Key? key,
    required this.text,}) : super(key: key);

  final  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.substring(0,32),
      maxLines: 2,
      style: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: ColorManger.greyBordColor,
      ),);
  }
}
