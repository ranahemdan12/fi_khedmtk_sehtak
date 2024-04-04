import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class PackItemTitleText1 extends StatelessWidget {
  const PackItemTitleText1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(StringManger.packageOfChild,
      style: GoogleFonts.montserrat(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color:ColorManger.blueColor ,
      ),
    );
  }
}
