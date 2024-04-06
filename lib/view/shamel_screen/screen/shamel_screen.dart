import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

import '../widget/discount_container.dart';
import '../widget/discount_row.dart';
import '../widget/get_shamel_expansion.dart';
import '../widget/shamel_expansion.dart';
import '../widget/frequntly _row.dart';
import '../widget/percent_row.dart';
import '../widget/subsc_shamel_expansion.dart';

class ShamelScreen extends StatelessWidget {
  const ShamelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.shamel, body:SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 26,end: 26),
        child: Column(
          children: [
            SizedBox(height: 15.h,),

            CustomRowLocation(),
            SizedBox(height: 20.h,),
            PercentRow(),
            SizedBox(height: 20.h,),
            DiscountRow(),
            SizedBox(height: 10.h,),
            DiscountContainer(),
            SizedBox(height: 13.h,),
            FrequentlyRow(),
            SizedBox(height: 13.h,),
            ShamelExpansion(),
            SizedBox(height: 13.h,),
            SubscExpansion(),
            SizedBox(height: 13.h,),
            GetShamelExpansion(),
            SizedBox(height: 46.h,),
            CustomButton(text: StringManger.selectPlan, onPressed: (){
              ShowSheet(context);
            }),
            SizedBox(height: 30.h,),
      
          ],
        ),
      ),
    ));
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
          height: 149.h,
          width: 390.w,
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 26,top: 26,end: 16),
            child: Column(

              children: [

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text(StringManger.close,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManger.redColor,
                      ),),
                    Text(StringManger.plans,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManger.blueColor,
                      ),),
                  ],),
                SizedBox(
                  height: 31.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                    Text('One Year 600 EGP',
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: ColorManger.blueColor,
                      ),),
                    Container(
                      width: 100,
                      height: 29.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: ColorManger.blueColor,
                      ),
                      child: MaterialButton(
                        onPressed: (){},
                        child: Text(
                          StringManger.proceed,
                          style: GoogleFonts.montserrat(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                            color: ColorManger.whiteColor,
                          ),
                        ),
                      ),
                    )

                  ],),


              ],
            ),
          ),

        );
      });
}