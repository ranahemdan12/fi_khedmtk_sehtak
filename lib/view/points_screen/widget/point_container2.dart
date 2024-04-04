import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class PointsContainer2 extends StatelessWidget {
  const PointsContainer2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 106.h,
      width: 338.w,
      decoration: BoxDecoration(
        color: ColorManger.whiteGColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorManger.mainColor)
      ),
      child: Padding(
        padding:EdgeInsetsDirectional.symmetric(horizontal: 9),
        child: Column(


          children: [
            SizedBox(height: 9.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(StringManger.today,
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.blackColor,
                      ),),
                    Text(', 04:32 AM',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.blackColor,
                      ),),
                  ],
                ),
                Text('#TR2273',
                  style: GoogleFonts.montserrat(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: ColorManger.labelGrayColor,
                  ),),

              ],
            ),
            SizedBox(height: 16.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(StringManger.payment,
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.blackColor,
                      ),),
                    Text('#TR6473',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.blackColor,
                      ),),
                  ],
                ),
                Row(
                  children: [
                    Image.asset(AssetManger.coinIcon),
                    SizedBox(width: 2.w,),
                    Text('-100',
                      style: GoogleFonts.montserrat(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: ColorManger.redColor,
                      ),),
                  ],
                ),

              ],
            ),

          ],),
      ),
    );
  }
}
