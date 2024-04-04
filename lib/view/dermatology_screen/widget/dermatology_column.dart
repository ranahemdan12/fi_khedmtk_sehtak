import 'package:fi_khedmtk_sehtak/view/dermatology_screen/widget/payment_row.dart';
import 'package:fi_khedmtk_sehtak/view/dermatology_screen/widget/timing_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/statics/routes.dart';
import 'Specialization_row.dart';
import 'book_button.dart';
import 'derma_text1.dart';
import 'derma_text2.dart';
import 'derma_text3.dart';
import 'location_row.dart';

class DermatologyColumn extends StatelessWidget {
  const DermatologyColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.doctorProfileScreen);
      },
      child: Container(
        width: 338.w,
        height: 300.h,
        decoration: BoxDecoration(
          color: ColorManger.whiteDColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorManger.mainColor,),
        ),
        child: Padding(
          padding:  EdgeInsetsDirectional.only(start: 8,end: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 8.w,),
              Row(  crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(

                    backgroundColor:ColorManger.whiteGreyColor ,
                    child: Image.asset(AssetManger.profileIcon,
                      width: 63.w,
                      height:63.h,
                    ),
                  ),
                  SizedBox(width: 11.w,),
                  Column(
                   crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                    DermaText1(text: 'Dr . Samar Ahmed Omar'),
                    SizedBox(height: 5.h,),
                    Row(
                      children: [
                      SvgPicture.asset(AssetManger.starIcon,
                     width: 16.w,
                      height: 16.h,),
                      SizedBox(width: 4.w,),
                      SvgPicture.asset(AssetManger.starIcon,
                        width: 16.w,
                        height: 16.h,),
                      SizedBox(width: 4.w,),
                      SvgPicture.asset(AssetManger.starIcon,
                        width: 16.w,
                        height: 16.h,),
                      SizedBox(width: 4.w,),
                    ],),
                      SizedBox(height: 5.h,),
                      DermaText2(text: 'Overall Rating from 136 visitors'),

                  ],),
                ],
              ),
              SizedBox(height: 10.w,),
              DermaText3(text: 'Dermatology, cosmetic and laser specialist'),
              SpecializationRow(),
              SizedBox(height: 11.h,),
              LocationRow(),
              SizedBox(height: 11.h,),
              PaymentRow(),
              TimingRow(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BookButton(onPressed: (){
                    Navigator.pushNamed(context,Routes.selectAreaScreen);
                  }),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
