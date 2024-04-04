import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';



import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';


class AreaListItem extends StatelessWidget {
  const AreaListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 16),
        child: Container(
          width: 90.w,
          height: 132.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: ColorManger.whiteGreyColor,

            ),
          ),
          child: Column(


            children: [
              Container(
                height: 37.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: ColorManger.blueColor,
                  borderRadius: BorderRadius.only(

                  topRight: Radius.circular(5),
                      topLeft:Radius.circular(5), ),
                      ),


                child:  Text('Day',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color:ColorManger.whiteColor ,
                  ),
                ),

              ),
              Container(
                height: 67.4.h,
                width: 90.w,

                color: ColorManger.whiteColor,
                child:  Text('09:00 PM       TO             11:00 PM',
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color:ColorManger.labelGrayColor ,
                  ),
                ),

              ),
              Container(
                height: 25.h,
                width: 90.w,
                decoration: BoxDecoration(
                  color: ColorManger.redColor,

                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(5),
                  bottomLeft:Radius.circular(5), ),
                ),

                child:  Text(StringManger.book,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color:ColorManger.whiteColor ,
                  ),
                ),

              ),




            ],
          ),
        ),
      ),
    );
  }
}
