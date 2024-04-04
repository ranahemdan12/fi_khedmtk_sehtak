import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.serviceScreen);
      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 8),
        child: Container(
          width: 114.w,
          height: 108.h,
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
                  width: 50.w,
                  height: 50.h,),
                  SizedBox(height: 14.h,),
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
        ),
      ),
    );
  }
}
