import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';

class AdvSliderScreen extends StatelessWidget {
  const AdvSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return  Padding(
      padding:EdgeInsetsDirectional.symmetric(horizontal: 26.w),
      child: Column(
        children: [
          BannerCarousel.fullScreen(
            customizedIndicators: IndicatorModel.animation(
                width: 16.w, height: 3.h, spaceBetween: 3,widthAnimation:34 ),
            height: 150.h,
            activeColor: ColorManger.blueColor,
            viewportFraction: 1,
            animation: true,
            initialPage: 1,
            customizedBanners: [
              Image.asset(AssetManger.advIcon,
                width: 338.w,
                height: 188.h,
                fit: BoxFit.fill,
              ),
              Image.asset(AssetManger.advIcon,
                width: 338.w,
                height: 188.h,
                fit: BoxFit.fill,
              ),
              Image.asset(AssetManger.advIcon,
                width: 338.w,
                height: 188.h,
                fit: BoxFit.fill,
              ),


            ],
          ),

        ],
      ),
    );;
  }
}
