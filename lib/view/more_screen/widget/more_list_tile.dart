import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class MoreListTile extends StatelessWidget {
  MoreListTile({
    Key? key,
    required this.svgImage,
    required this.text,
  }) : super(key: key);

  final String svgImage;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(


      decoration: BoxDecoration(
        color: ColorManger.whiteGColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: ColorManger.blueColor,
          )),
      child: ListTile(
        minLeadingWidth: 0,
        titleAlignment: ListTileTitleAlignment.center,
        leading: SvgPicture.asset(
          svgImage,
          width: 20.w,
          height: 20.h,
          fit: BoxFit.scaleDown,
        ),
        title: Text(
          text,
          style: GoogleFonts.montserrat(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.blueColor,
          ),
        ),


      ),
    );
  }
}
// Container(
//   decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(8),
//       border: Border.all(color:ColorManger.deepBlueColor ,
//        )
//
//
//   ),
//   child: ListTile(
//     leading: SvgPicture.asset(AssetManger.profileTileIcon,),
//     title:Text(StringManger.profile) ,
//   ),
// ),