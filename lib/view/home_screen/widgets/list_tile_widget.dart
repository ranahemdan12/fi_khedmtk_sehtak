import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:EdgeInsetsDirectional.only(start:10,end:10),
      child: ListTile(
        // leading: CircleAvatar(
        //
        //   backgroundColor:ColorManger.whiteGreyColor ,
        //   child: Image.asset(AssetManger.profileIcon,
        //     width: 63.w,
        //     height:63.h,
        //   ),
        // ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

          Text(
            StringManger.homeTitleTile1,
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color:ColorManger.blackColor ,
            ),),
          Text(StringManger.homeTitleTile,
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              fontWeight: FontWeight.w500,
              color:ColorManger.blackColor ,
            ),),
        ],),
        trailing: GestureDetector(
          onTap: (){
            Navigator.pushNamed(context, Routes.cartScreen);
          },
          child: Wrap(
            children: [
              SvgPicture.asset(AssetManger.cartIcon,fit: BoxFit.scaleDown),
            ],
          ),
        ),


      ),
    );
  }
}
