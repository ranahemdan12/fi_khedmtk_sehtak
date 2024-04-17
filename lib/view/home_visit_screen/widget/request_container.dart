import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestContainer extends StatelessWidget {
  const RequestContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.h,
      width: 336.w,
      decoration: BoxDecoration(
        color: ColorManger.whiteGColor,
        border: Border.all(
          color: ColorManger.mainColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),

      child:ListTile(
        horizontalTitleGap: 2,
       contentPadding: EdgeInsetsDirectional.only(start: 13,end: 0),
       leading: SvgPicture.asset(AssetManger.requestIcon),
        title: Text(StringManger.requestBy,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.blueColor,
          ),

        ),
        subtitle:Text(StringManger.uploadImage,
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: ColorManger.labelGrayColor,
          ),

        ) ,
        trailing: Wrap(

          children: [IconButton(onPressed: (){
            showAlertDialog(context);
          }, icon: Icon(Icons.arrow_forward_ios_sharp,
            size: 20,
            color: ColorManger.blueColor,
          ),
          ),]
        ),

      )
      ,
    );
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