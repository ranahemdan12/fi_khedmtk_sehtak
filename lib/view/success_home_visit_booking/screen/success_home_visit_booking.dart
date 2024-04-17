import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class SuccessHomeVisitBooking extends StatelessWidget {
  const SuccessHomeVisitBooking({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:  StringManger.bookVisitDoctor,
      actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),), body: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: Column(

            children: [

          SizedBox(height: 149.h,),
           Image.asset(AssetManger.successBookVisit),
              SizedBox(height: 12.h,),
              Text(
                StringManger.thankYou,
                style: GoogleFonts.montserrat(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorManger.blackColor,
                ),
              ),
              SizedBox(height: 12.h,),
              Text(
                StringManger.willBeContacted,
                style: GoogleFonts.montserrat(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w600,
                  color: ColorManger.labelGrayColor,
                ),
              ),

          ],),
      ));
  }
}
