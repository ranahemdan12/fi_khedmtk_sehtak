import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';


class PercentRow extends StatelessWidget {
  const PercentRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetManger.percentIcon),
        SizedBox(width: 8.w,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(StringManger.shamel,
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: ColorManger.blueColor,
              ),


            ),
            Text('Comprehensive and affordable care',
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: ColorManger.blackColor,
              ),


            ),

          ],
        )
      ],
    );
  }
}
