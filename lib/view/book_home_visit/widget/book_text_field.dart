import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/color_manger.dart';

class BookTextField extends StatelessWidget {
  BookTextField({
    Key? key,
    required this.text,
    required this.keyboardType,
    required this.textEditingController,
    required this.hintText,
  }) : super(key: key);

  final String text;
  TextInputType keyboardType;
  TextEditingController textEditingController;
  String? hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              text,
              style: GoogleFonts.montserrat(
                fontSize: 16.sp,
                fontWeight: FontWeight.w500,
                color: ColorManger.labelGrayColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 9.h,
        ),
        Container(
          height: 80.h,
          child: TextField(
            keyboardType: keyboardType,
            controller: textEditingController,
            decoration: InputDecoration(
              contentPadding:
              EdgeInsetsDirectional.only(start: 25, top: 15, bottom: 15),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.blueColor, width: 1),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),

              hintText: hintText,
              hintStyle: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: ColorManger.whiteGreyColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
