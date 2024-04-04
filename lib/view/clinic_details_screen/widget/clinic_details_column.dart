import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class ClinicDetailsColumn extends StatelessWidget {
  const ClinicDetailsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(AssetManger.clinicIcon),
        SizedBox(height: 8.h,),
        Text('Misr Modern clinics Clinics',
        style: GoogleFonts.montserrat(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.blackColor,
        ),),
        SizedBox(height: 8.h,),
        Text('Overall Rating from 136 visitors',
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.mainColor,
          ),),
        SizedBox(height: 8.h,),
        Row(mainAxisAlignment: MainAxisAlignment.center,
            children:[ SvgPicture.asset(AssetManger.starIcon),
          SvgPicture.asset(AssetManger.starIcon),]),
        SizedBox(height: 15.h,),
        Text('26340 Views',
          style: GoogleFonts.montserrat(
            fontSize: 11.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.mainColor,
          ),),


      ],
    );
  }
}
