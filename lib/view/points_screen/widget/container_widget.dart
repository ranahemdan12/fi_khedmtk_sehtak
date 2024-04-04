import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class PointsContainer extends StatelessWidget {
  const PointsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146.h,
      width: 338.w,
      decoration: BoxDecoration(
        color: ColorManger.blueColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 11,end: 11,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(height: 5.h,),
            Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [SvgPicture.asset(AssetManger.whiteStarsIcon)]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(StringManger.points,
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorManger.whiteColor,
                ),),
              Text(' 0',
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorManger.whiteColor,
                ),),
              SizedBox(width: 5.w,),
              SvgPicture.asset(AssetManger.starIcon),
            ],
          ),
            SizedBox(width: 5.w,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(StringManger.latestUpdate,
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManger.whiteColor,
                  ),),
                Text('5 March,2024 ',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManger.whiteColor,
                  ),),
                SizedBox(width: 5.w,),

              ],
            ),
            Row(
                children: [SvgPicture.asset(AssetManger.whiteStarsIcon)]),

        ],),
      ),
    );
  }
}
