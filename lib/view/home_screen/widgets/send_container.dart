import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';

class SendContainer extends StatelessWidget {
  const SendContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.h,
      width: 338.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:ColorManger.whiteBlueColor,
      ),
      child: GestureDetector(
        onTap: (){Navigator.pushNamed(context, Routes.addPresScreen);},
        child: Padding(
          padding: EdgeInsetsDirectional.only(start: 17),
          child: Row(children: [
            SvgPicture.asset(AssetManger.pdfIcon),
            SizedBox(width: 4.w,),
            Text(
              StringManger.SendPresc,
              style: GoogleFonts.montserrat(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color:ColorManger.blueColor ,
              ),),
          ],),
        ),
      ),
    );
  }
}
