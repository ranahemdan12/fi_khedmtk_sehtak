import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class PackItemTitleText3 extends StatelessWidget {
  const PackItemTitleText3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(StringManger.bookmdz,
      maxLines: 6,
      overflow: TextOverflow.ellipsis,
      style: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color:ColorManger.labelGrayColor ,
      ),
    );
  }
}