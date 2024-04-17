import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/strings_manger.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       width: 338.w,
      height:84.h ,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManger.blueColor),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(bottom: 10),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(width: 8.w,),
            Image.asset(AssetManger.coinIcon),
            SizedBox(width: 5.w,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hand Eczema',
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                    color: ColorManger.blackColor,
                  ),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'In case of cash ',
                        style: GoogleFonts.montserrat(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: ColorManger.blackColor,
                        ),
                        children: [
                          TextSpan(text: '200 EGP',  style: GoogleFonts.montserrat(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: ColorManger.blueColor,
                          ),),

                        ],
                      ),
                    ),
                    SizedBox(width: 135.w,),
                    GestureDetector(
                      onTap: (){
                        ShowSheet(context);
                      },

                        child: SvgPicture.asset(AssetManger.plusIcon)),
                  ],
                ),
                RichText(
                  text: TextSpan(
                    text: 'Booking through the application is  ',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: ColorManger.blackColor,
                    ),
                    children: [
                      TextSpan(text: '50 EGP',  style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: ColorManger.redColor,
                      ),),

                    ],
                  ),
                ),


              ],
            ),
          ],
        ),
      ),

    );
  }
}


void ShowSheet(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 274.h,
          width: 390.w,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 26,top: 26,end: 16),
            child: Column(

              children: [

                CustomContainer(),
                SizedBox(height: 25.h,),
                Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  SvgPicture.asset(AssetManger.plus2Icon),
                  SizedBox(width: 6.w,),
                  Text('Add Other Services',
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: ColorManger.blueColor,
                    ),),
                ],),
                SizedBox(height: 25.h,),
                CustomButton(text: 'Choose Service Provider', onPressed: (){}),

              ],
            ),
          ),

        );
      });
}