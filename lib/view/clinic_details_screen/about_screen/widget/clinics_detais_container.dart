import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../shared/resources/strings_manger.dart';

class ClinicsDetailsContainer extends StatelessWidget {
  const ClinicsDetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width:338.w,
      decoration: BoxDecoration(
        border: Border.all(
          color: ColorManger.blueColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 3),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManger.clinicsBranches,
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color:  ColorManger.blueColor,
              ),

            ),
            Text('-Misr Modern branch',
              maxLines: 2,
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color:  ColorManger.greyItemColor,
              ),

            ),
          ],
        ),
      ),
    );
  }
}