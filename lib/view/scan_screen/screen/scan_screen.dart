import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';

import '../../../shared/statics/routes.dart';

import '../widget/row_location.dart';
import '../widget/scan_container.dart';
import '../widget/works_container.dart';


class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.scan,
        actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),body: Padding(
          padding:EdgeInsetsDirectional.only(start: 26,end: 26),
          child: Column(
                children: [
                  SizedBox(height: 21.h,),
                  RowLocation(),
              SizedBox(height: 21.h,),
               ScanContainer(svgPic: AssetManger.bookPresIcon, text: StringManger.bookBy,onTab2: (){showAlertDialog(context);},),
                  SizedBox(height: 9.h,),
                  ScanContainer(svgPic: AssetManger.callSuppIcon, text: StringManger.callSupport,),
                  SizedBox(height: 9.h,),
                  ScanContainer(svgPic: AssetManger.discountIcon, text: StringManger.discountShamel,textT: StringManger.details,onTab: (){
                    Navigator.pushNamed(context, Routes.shamelScreen);


                  },),
                  SizedBox(height: 27.h,),
                  WorksContainer(),





                ],
              ),
        ));
  }
}
showAlertDialog(BuildContext context) {





  AlertDialog alert = AlertDialog(
    title:Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(

            side: BorderSide(
              color: ColorManger.mainColor,
            ),
          ),
          elevation: 10,
          shadowColor: ColorManger.labelGrayColor,
          child: ListTile(
            horizontalTitleGap: 0,
            leading: SvgPicture.asset(AssetManger.cameraBookIcon),
            title: Text(
              StringManger.camera,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorManger.blackColor,
              ),
            ),


          ),
        ),

        SizedBox(height: 7,),
        Card(
          shape: RoundedRectangleBorder(

            side: BorderSide(
              color: ColorManger.mainColor,
            ),
          ),
          elevation: 5,
          shadowColor: ColorManger.labelGrayColor,
          child: ListTile(
           horizontalTitleGap: 0,
            leading: SvgPicture.asset(AssetManger.galleryBookIcon),
            title: Text(
              StringManger.gallery,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorManger.blackColor,
              ),
            ),


          ),
        ),
      ],
    ),
    content: Text("Select product picture or prescription ",style:  GoogleFonts.montserrat(
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: ColorManger.labelGrayColor,
    ),),

  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}