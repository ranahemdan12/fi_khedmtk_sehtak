import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class DermaText3 extends StatelessWidget {
  const DermaText3({Key? key,
    required this.text,}) : super(key: key);

  final  String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: GoogleFonts.montserrat(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: ColorManger.greyItemColor,
      ),);
  }
}
