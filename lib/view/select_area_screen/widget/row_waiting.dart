import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class WaitingRow extends StatelessWidget {
  const WaitingRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 24),
      child: Row(
        children: [
          SvgPicture.asset(AssetManger.waitingIcon),
          SizedBox(width: 2.w,),
          Text(StringManger.waitingTime,
            style: GoogleFonts.montserrat(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.greyItemColor,
            ),),
          Text('Hour',
            style: GoogleFonts.montserrat(
              fontSize: 11.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.greyItemColor,
            ),),

        ],
      ),
    );
  }
}