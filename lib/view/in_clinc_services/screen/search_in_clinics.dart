import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

class SearchInClinics extends StatelessWidget {
  SearchInClinics({Key? key}) : super(key: key);

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return CustomScreen(text: StringManger.search, body: Padding(
      padding: EdgeInsetsDirectional.only(start: 26,end: 26),
      child: Column(children: [
        SizedBox(height: 40.h,),
        Container(
          height: 60.h,
          width: 338.w,

          child: TextField(
            keyboardType: TextInputType.text,
            controller: textController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              contentPadding:
              EdgeInsetsDirectional.only(start: 25, top: 15, bottom: 15),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.mainColor, width: 1),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManger.mainColor, width: 1),
              ),

              fillColor: ColorManger.whiteColor,
              filled: true,
              hintText: 'Search for services ',
              hintStyle: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: ColorManger.labelGrayColor,
              ),
              prefixIcon: Icon(Icons.search_rounded,
              color: ColorManger.labelGrayColor,),

              ),
            ),
          ),]),



     ),
    );
  }
}
