import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class ServiceGridItem extends StatelessWidget {
  const ServiceGridItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 159.w,
      height: 142.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManger.blueColor,
          width: 2.w,
        ),
      ),
      child: Padding(
        padding:  EdgeInsetsDirectional.only(top: 13),
        child: Center(
          child: Column(
            children: [
              SvgPicture.asset(AssetManger.serviceIcon,
                width: 80.w,
                height: 80.h,),
              SizedBox(height: 10.h,),
              Text(StringManger.doctor,
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color:ColorManger.blueColor ,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
