import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class DiscountListTile extends StatelessWidget {
  DiscountListTile({Key? key,
    required this.svg,
    required this.text,
    required this.text2,


  }) : super(key: key);


  String svg;
  String text;
  String text2;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 0,
      horizontalTitleGap: 0,
      minLeadingWidth: 0,

      leading: Image.asset(svg),
      title: Text(  text,
        style: GoogleFonts.montserrat(
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          color: ColorManger.blackColor,
        ),
      ),
      subtitle: Text(  text2,
        style: GoogleFonts.montserrat(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: ColorManger.labelGrayColor,
        ),
      ),
    );
  }
}
