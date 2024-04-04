import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/row_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../dermatology_screen/widget/derma_text1.dart';
import '../../dermatology_screen/widget/derma_text2.dart';

class RowProfile extends StatelessWidget {
  const RowProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, Routes.doctorProfileScreen);
      },
      child: Padding(
        padding:EdgeInsetsDirectional.only(start: 26,end: 24),
        child: Row(  crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 8.h,),
                DermaText2(text: 'Overall Rating from 136 visitors'),
                SizedBox(height: 8.h,),
                RowText(text: 'Dermatologist&Aesthetic medicine specialist'),
                SizedBox(height: 8.h,),
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


              ],),
          ],
        ),
      ),
    );
  }
}
