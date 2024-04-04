import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class ClinicsContainer extends StatelessWidget {
  const ClinicsContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.clinicsDetailsScreen);
      },
      child: Padding(
        padding:EdgeInsetsDirectional.only(start: 26,end: 24),
        child: Container(
          width: 338.w,
          height: 52.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),

            color: ColorManger.blueCColor,
          ),
          child: Padding(
            padding:EdgeInsetsDirectional.only(start: 8),
            child: Row(

              children: [
                Image.asset(AssetManger.areaContIcon,),
                SizedBox(width: 3.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5.h,),
                  RichText(
                    text: TextSpan(
                      text: 'Misr Modern chlinics ',
                      style: GoogleFonts.montserrat(
                        fontSize: 11.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.blueColor,
                      ),
                      children: [
                        TextSpan(text:' ( Dokki )' ,  style: GoogleFonts.montserrat(
                          fontSize: 11.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorManger.blackColor,
                        ),),

                      ],
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  Text('Book and you will receive the address',
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManger.labelGrayColor,
                    ),),
                ],),
              ],
            ),
          ),


        ),
      ),
    );
  }
}
