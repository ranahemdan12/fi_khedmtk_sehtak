import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class RatingRow extends StatelessWidget {
  const RatingRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 24),
      child: Row(
        children: [
          SvgPicture.asset(AssetManger.starIcon,

           ),
          Text('4.5/5 Clinic Rating',
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.blackColor,
            ),),
          SizedBox(width: 29.w,),
          SvgPicture.asset(AssetManger.starIcon,

          ),
          Text('4/5Assistant Rating',
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              fontWeight: FontWeight.w500,
              color: ColorManger.blackColor,
            ),),

        ],
      ),
    );
  }
}
