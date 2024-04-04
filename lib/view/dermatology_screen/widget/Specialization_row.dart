import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';

class SpecializationRow extends StatelessWidget {
  const SpecializationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AssetManger.specializationIcon,
       ),
        SizedBox(width: 5.w,),
        Text('Dermatology specialized in Dermatology Coshdfhsh...'.substring(0,39),
          overflow: TextOverflow.ellipsis,
          maxLines:1,
          style: GoogleFonts.montserrat(
            fontSize: 11.sp,
            fontWeight: FontWeight.w500,
            color: ColorManger.labelGrayColor,
          ),)
      ],
    );
  }
}
