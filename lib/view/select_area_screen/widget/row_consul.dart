import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class ConsulRow extends StatelessWidget {
  const ConsulRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 24),
      child: Row(
        children: [
          SvgPicture.asset(AssetManger.consulIcon),
          SizedBox(width: 2.w,),
          Text(StringManger.consultationFees,
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.greyItemColor,
            ),),
          Text('450 EGP',
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.greyItemColor,
            ),),

        ],
      ),
    );
  }
}
