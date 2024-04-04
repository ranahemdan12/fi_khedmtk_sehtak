import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RatingContainer extends StatelessWidget {
  RatingContainer({Key? key,
  required this . text,}) : super(key: key);
  String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: 159.w,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManger
        .dividerColor,),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Text(text,
            style: GoogleFonts.montserrat(
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.blackColor,
            ),

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetManger.starIcon,
              height: 20.h,
              width: 20.w,),
              SvgPicture.asset(AssetManger.starIcon,
                height: 20.h,
                width: 20.w,),
            ],
          ),
        ],
      ),

    );
  }
}
