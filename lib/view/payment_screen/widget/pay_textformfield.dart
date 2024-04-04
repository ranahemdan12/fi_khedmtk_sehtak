import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class PayTextFormField extends StatelessWidget {
  PayTextFormField({Key? key}) : super(key: key);

  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      child: TextFormField(
        validator: (value){},


        controller: phoneController,
        decoration: InputDecoration(
          counterText: StringManger.counterText,
          counterStyle:  GoogleFonts.montserrat(
            fontSize:10.sp,
            fontWeight: FontWeight.w400,
            color:ColorManger.greyBordColor ,
          ),
          contentPadding: EdgeInsetsDirectional.only(start: 16,top: 12,bottom: 12),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.shadowColor,
                width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorManger.shadowColor,
                width: 1),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: ColorManger.whiteColor,
          filled:true,
          hintText: StringManger.phoneNumber,
          hintStyle:  GoogleFonts.montserrat(
            fontSize:14.sp,
            fontWeight: FontWeight.w400,
            color:ColorManger.greyBordColor ,
          ),
        ),
      ),
    );
  }
}
