import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_manger.dart';

class MyTheme {


  static ThemeData lightTheme =ThemeData(
    scaffoldBackgroundColor: ColorManger.whiteColor,


    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color:ColorManger.blackColor ,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color:ColorManger.blueColor ,
      ),
      labelLarge:GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color:ColorManger.blackColor ,
      ),



    ),
  );
}