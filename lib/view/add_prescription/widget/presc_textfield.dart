import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class PrescTextField extends StatelessWidget {
  const PrescTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  TextField(
      decoration: InputDecoration(
        contentPadding: EdgeInsetsDirectional.only(start: 19,top: 15,bottom: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),




        fillColor: ColorManger.whiteGColor,
        filled:true,
        hintText: StringManger.addPrescription,
        hintStyle:  GoogleFonts.montserrat(
          fontSize:16.sp,
          fontWeight: FontWeight.w500,
          color:ColorManger.labelGrayColor ,
        ),
      ),
    );
  }
}
