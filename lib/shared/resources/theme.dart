import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'color_manger.dart';
import 'font_manger.dart';



class MyTheme {


  static ThemeData lightTheme =ThemeData(
  /*  useMaterial3: false,*/
    scaffoldBackgroundColor: ColorManger.whiteColor,

    sliderTheme: const SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
    ),

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: FontSize.s16,
        fontWeight: FontManger.semiBold,
        color:ColorManger.blackColor ,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize:  FontSize.s16,
        fontWeight: FontManger.semiBold,
        color:ColorManger.blueColor ,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: FontSize.s14,
        fontWeight: FontManger.semiBold,
        color:ColorManger.mainColor ,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: FontSize.s11,
        fontWeight:  FontManger.medium,
        color: ColorManger.greyBordColor,
      ),
      titleLarge:  GoogleFonts.montserrat(
        fontSize: FontSize.s12,
        fontWeight:  FontManger.medium,
        color:  ColorManger.greyItemColor,
      ),
      displayLarge:  GoogleFonts.montserrat(
        fontSize: FontSize.s16,
        fontWeight: FontManger.semiBold,
        color:ColorManger.labelGrayColor ,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: FontSize.s14,
        fontWeight: FontManger.medium,
        color: ColorManger.whiteGreyColor,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: FontSize.s14,
        fontWeight: FontManger.medium,
        color: ColorManger.redColor,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: FontSize.s18,
        fontWeight: FontManger.semiBold,
        color:ColorManger.labelGrayColor ,
      ) ,
      labelLarge:GoogleFonts.montserrat(
        fontSize: FontSize.s20,
        fontWeight: FontManger.bold,
        color:ColorManger.blackColor ,
      ),
     titleMedium: GoogleFonts.montserrat(
       fontSize: FontSize.s12,
       fontWeight: FontManger.semiBold,
       color:ColorManger.whiteColor ,
     ),
      titleSmall:   GoogleFonts.montserrat(
      fontSize: FontSize.s12,
      fontWeight: FontManger.light,
      color: ColorManger.greyRColor,
    ),



    ),
  );
  static ThemeData darkTheme =ThemeData(
    /*  useMaterial3: false,*/
    scaffoldBackgroundColor: Colors.black,

    sliderTheme: const SliderThemeData(
      showValueIndicator: ShowValueIndicator.always,
    ),

    textTheme: TextTheme(
      bodyLarge: GoogleFonts.montserrat(
        fontSize: 16/*.sp*/,
        fontWeight: FontWeight.w600,
        color:ColorManger.blackColor ,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 16/*.sp*/,
        fontWeight: FontWeight.w600,
        color:ColorManger.blueColor ,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 14/*.sp*/,
        fontWeight: FontWeight.w600,
        color:ColorManger.mainColor ,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 11/*.sp*/,
        fontWeight: FontWeight.w500,
        color: ColorManger.greyBordColor,
      ),
      titleLarge:  GoogleFonts.montserrat(
        fontSize: 12/*.sp*/,
        fontWeight: FontWeight.w500,
        color:  ColorManger.greyItemColor,
      ),
      displayLarge:  GoogleFonts.montserrat(
        fontSize: 16/*.sp*/,
        fontWeight: FontWeight.w600,
        color:ColorManger.labelGrayColor ,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 14/*.sp*/,
        fontWeight: FontWeight.w500,
        color: ColorManger.whiteGreyColor,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 14/*.sp*/,
        fontWeight: FontWeight.w500,
        color: ColorManger.redColor,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 18/*.sp*/,
        fontWeight: FontWeight.w600,
        color:ColorManger.labelGrayColor ,
      ) ,
      labelLarge:GoogleFonts.montserrat(
        fontSize: 20/*.sp*/,
        fontWeight: FontWeight.w700,
        color:ColorManger.blackColor ,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 12/*.sp*/,
        fontWeight: FontWeight.w600,
        color:ColorManger.whiteColor ,
      ),
      titleSmall:   GoogleFonts.montserrat(
        fontSize: 12/*.sp*/,
        fontWeight: FontWeight.w400,
        color: ColorManger.greyRColor,
      ),


    ),
  );
}