import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';

class BookButton extends StatelessWidget {
  BookButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100.w,
      height: 34.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorManger.blueColor,
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          StringManger.bookNow,
          style: GoogleFonts.montserrat(
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.whiteColor,
          ),
        ),
      ),
    );
  }
}
