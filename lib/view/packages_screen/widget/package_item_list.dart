import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/package/get_package.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';


class PackageItemList extends StatelessWidget {
   PackageItemList({Key? key,required this.packageItem}) : super(key: key);
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
              RichText(text: TextSpan(
                text: StringManger.priceBeforeDiscount.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorManger.blueColor,
                    fontSize: 12.sp),
                children: [
                  TextSpan(text:  "${packageItem?.serviceFee }",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 11),),
                ],

              ),),
              SizedBox(height: 8.w,),
              RichText(text: TextSpan(
                text: StringManger.priceAfterDiscount.tr(),
                style: Theme.of(context).textTheme.labelMedium?.copyWith(color: ColorManger.blueColor,),
                children: [
                  TextSpan(text:"${packageItem?.sehtakFee }",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(color: ColorManger.redColor,
                        fontSize: 11),),
                ],

              ),


              ),
            ],
          ),
        ),



      ),
    );
  }
}
