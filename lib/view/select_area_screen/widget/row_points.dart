import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class PointsRow extends StatelessWidget {
  const PointsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 24),
      child: Row(children: [

        Image.asset(AssetManger.coinIcon),
        Text('You`ll earn 450 points after booking',
          style: GoogleFonts.montserrat(
            fontSize: 15.sp,
            fontWeight: FontWeight.w500,
            color: ColorManger.blackColor,
          ),

        ),

      ],),
    );
  }
}
