import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsContainer extends StatelessWidget {
  const DetailsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53.h,
      width: 338.w,
      decoration: BoxDecoration(
        border:Border.all(
          color: ColorManger.dividerColor,
        ),
      ),
      child: Row(

        children: [
          SizedBox(width: 9.w,),
          SvgPicture.asset(AssetManger.specializationIcon,
          color: ColorManger.blueColor,
          height: 30.h,
          width: 30.w,),
          SizedBox(width: 2.w,),
          Column(
            children: [
              Text(StringManger.specialities,
                style:GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManger.blackColor,
                ),
              ),

              Text('26 Specialities',
                style:GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManger.greyItemColor,
                ),
              ),


            ],
          ),
          SizedBox(width: 40.w,),
          VerticalDivider( width: 1,

            thickness: 1,
            indent: 9,
            endIndent: 8,
            color: ColorManger.whiteGreyColor,),
          SizedBox(width: 40.w,),
          SvgPicture.asset(AssetManger.doctorsIcon),
          SizedBox(width: 2.w,),
          Column(
            children: [
              Text(StringManger.doctors,
                style:GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManger.blackColor,
                ),
              ),

              Text('45 Doctors',
                style:GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: ColorManger.greyItemColor,
                ),
              ),


            ],
          ),
        ],
      ),
    );
  }
}
