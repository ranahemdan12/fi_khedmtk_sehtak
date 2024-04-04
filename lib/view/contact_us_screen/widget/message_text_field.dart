import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
class MessageTextField extends StatelessWidget {
  const MessageTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      maxLines: 6,
      decoration: InputDecoration(

        contentPadding: EdgeInsetsDirectional.only(start: 25,top: 15,bottom: 15),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.blueColor,
              width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorManger.blueColor,
              width: 1),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        fillColor: ColorManger.whiteGColor,
        filled:true,


        hintStyle:  GoogleFonts.montserrat(
          fontSize:14.sp,
          fontWeight: FontWeight.w500,
          color:ColorManger.labelGrayColor ,
        ),
      ),
    );
  }
}