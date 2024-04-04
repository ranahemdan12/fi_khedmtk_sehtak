import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/custom_help_text.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.help, body: Padding(
      padding:EdgeInsetsDirectional.only(top:23 ,start:26 ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        HelpText(text:StringManger.contactUs),
          SizedBox(height: 16.h,),
        Text('01210077100 / 0223824000',
        style: GoogleFonts.montserrat(
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: ColorManger.labelGrayColor,
        ),),
          SizedBox(height: 16.h,),
          HelpText(text:StringManger.theAddress),
          SizedBox(height: 16.h,),
          Text('Al-Hosary Mosque - 6 October',
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.labelGrayColor,
            ),),
          SizedBox(height: 16.h,),
          HelpText(text:StringManger.emailUsAt),
          SizedBox(height: 16.h,),
          Text('Health@gmail.com',
            style: GoogleFonts.montserrat(
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: ColorManger.labelGrayColor,
            ),),
          SizedBox(height: 16.h,),
          HelpText(text:StringManger.followUsOn),
          SizedBox(height: 16.h,),Row(children: [
            SvgPicture.asset(AssetManger.xIcon),
            SizedBox(width: 22.h,),
            SvgPicture.asset(AssetManger.faceIcon),
            SizedBox(width: 22.h,),
            SvgPicture.asset(AssetManger.tiktokIcon),
            SizedBox(width: 22.h,),
            SvgPicture.asset(AssetManger.instaIcon),
            SizedBox(width: 22.h,),
            SvgPicture.asset(AssetManger.whatsIcon),
          ],)

      ],),
    ));
  }
}
