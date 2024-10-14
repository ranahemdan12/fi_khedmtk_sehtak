import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/resources/asset_manger.dart';

class CashScreen extends StatelessWidget {
  const CashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManger.whiteColor,
      ),

        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
          child: Column(
                children: [
          SizedBox(height: 24.h,),
          Text(StringManger.nearestBranch.tr(),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.displaySmall?.copyWith(color: ColorManger.greyDropCityColor),
          ),
          SizedBox(height: 48.h,),
          Text('Dar Al Fouad Hospital ',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorManger.blueColor),
          ),
          SizedBox(height: 12.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(AssetManger.cLocationIcon,matchTextDirection: true,),
              SizedBox(width: 4.w,),
              Text('mdddddddddddddddddddddd',

                style: Theme.of(context).textTheme.displaySmall?.copyWith(color: ColorManger.blueColor,decoration:TextDecoration.underline ),
              ),
            ],
          ),
                ],
              ),
        ));
  }
}
