import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';

class CustomServiceColumn extends StatelessWidget {
  const CustomServiceColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height:35.h),
          Row(
            children: [
              GestureDetector(onTap: (){
                Navigator.pushNamed(context, Routes.doctorScreen);
              },
                  child: CustomServiceItem(svgImage: AssetManger.doctorIcon, text: StringManger.doctor)),
              SizedBox(width: 19.w,),
              GestureDetector(onTap: (){
                Navigator.pushNamed(context, Routes.labsScreen);
              },
                  child: CustomServiceItem(svgImage: AssetManger.labsIcon, text: StringManger.labs)),
            ],
          ),
          SizedBox(height:22.h),
          Row(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.hospitalsScreen);
                },

                  child: CustomServiceItem(svgImage: AssetManger.hospitalsIcon, text: StringManger.hospitals)),
              SizedBox(width: 19.w,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.scanScreen);
                },

                  child: CustomServiceItem(svgImage: AssetManger.scanIcon, text: StringManger.scan)),


              // SizedBox(width: 19.w,),
              // CustomServiceItem(svgImage: AssetManger.serviceIcon, text: StringManger.labs),
            ],
          ),
          SizedBox(height:22.h),
          Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.dentistryScreen);
                  },

                  child: CustomServiceItem(svgImage: AssetManger.dentistryIcon, text: StringManger.dentistry)),



              // SizedBox(width: 19.w,),
              // CustomServiceItem(svgImage: AssetManger.serviceIcon, text: StringManger.labs),
            ],
          ),

        ],
      ),
    );
  }
}
