import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import 'custom_cart_text.dart';
import 'custom_cart_text2.dart';

class MainCartContainer extends StatelessWidget {
  const MainCartContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      height: 290.h,
      decoration: BoxDecoration(
        border: Border.all(color: ColorManger.blueColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 8.0,top: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomCartText(text1: StringManger.name, text2: 'Ahmed Mohamed'),
            SizedBox(height: 8.h,),
            CustomCartText(text1: StringManger.address, text2: '176 Nile St., next to SheherazadeHotel - Agouza - Giza'),
            SizedBox(height: 8.h,),
            CustomCartText(text1: StringManger.bookingdate, text2: '27/3/2024'),
            SizedBox(height: 8.h,),
            CustomCartText(text1: StringManger.distance, text2: '4 Kg'),
            SizedBox(height: 8.h,),
            CustomCartText(text1: StringManger.price, text2:  '50 EGP'),
            SizedBox(height: 8.h,),
            CustomCartText(text1: StringManger.lab, text2: 'Al Shams Labs '),
            SizedBox(height: 8.h,),
            CustomCartText2(text1: StringManger.bloodUrea, text2: ' 50 EGP'),
            SizedBox(height: 8.h,),
            CustomCartText2(text1: StringManger.bloodUrea, text2: ' 50 EGP'),

          ],),
      ),
    );
  }
}
