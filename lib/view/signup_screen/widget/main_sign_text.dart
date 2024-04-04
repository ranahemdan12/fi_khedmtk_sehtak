import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class MainSignUpText extends StatelessWidget {
  const MainSignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      StringManger.createNewAccount,

      style: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: ColorManger.blackColor,
      ),
    );
  }
}
