import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class PackageItemList extends StatelessWidget {
  const PackageItemList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(top: 15,start: 26,end: 26),
      child: Container(
        width: 339.w,
        height: 135.h,
        decoration: BoxDecoration(color: ColorManger.whiteBlueColor,
          borderRadius: BorderRadius.circular(5),),

        child: Row(


          children: [
            SizedBox(width: 14.w,),
            CircleAvatar(
              radius: 45.sp,
              backgroundImage: AssetImage(AssetManger.packageItemIcon,

              ),

            ),
            SizedBox(width: 5.w,),
            Expanded(
              child: Column(

                children: [

                  Text(StringManger.titlePackageItem,
                    maxLines: 2,
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color:ColorManger.blackColor ,
                    ),
                  ),
                  SizedBox(height: 3.h,),
                  Text(StringManger.descPackageItem,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.montserrat(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w500,
                      color:ColorManger.greyItemColor ,
                    ),
                  ),
                ],),
            ),

          ],),

      ),
    );
  }
}
