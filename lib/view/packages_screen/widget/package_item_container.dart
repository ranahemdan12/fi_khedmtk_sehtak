import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../models/response/package/get_package.dart';
import '../../../shared/resources/color_manger.dart';

class PackageItemContainer extends StatelessWidget {
   PackageItemContainer({super.key,required this.packageItem});

  PackageItem? packageItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsetsDirectional.only(top: 15,start: 26,end: 26),
      child: Container(
        width: 339.w,
        // height: 135.h,
        decoration: BoxDecoration(color: ColorManger.whiteBlueColor,
          borderRadius: BorderRadius.circular(5),),

        child: Padding(
          padding: const EdgeInsetsDirectional.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(packageItem?.services??'',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ColorManger.blackColor),),
              SizedBox(height: 6.h,),
              // Text(packageItem?.description??'',
              //   style: Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.greyItemColor),),
            ],
          ),
        ),



      ),
    );
  }
}
