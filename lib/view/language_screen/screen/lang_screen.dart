import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:flutter/material.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override


  String ?lang;
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.language, body: Padding(
      padding:EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Column(children: [
        SizedBox(height: 45.h,),
        Container(
          decoration: BoxDecoration(border:Border.all(
            color:ColorManger.dividerColor,
          ),
          borderRadius: BorderRadius.circular(8)),
          child: RadioListTile(
            selectedTileColor: ColorManger.blueColor ,
            activeColor: ColorManger.blueColor,
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(StringManger.english,
              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color:ColorManger.blackColor ,
              ),),
            value: StringManger.english,
            groupValue: lang,
            onChanged: (value){
              setState(() {
                lang = value.toString();
              });
            },
          ),
        ),
        SizedBox(height: 15.h,),
        Container(
          decoration: BoxDecoration(border:Border.all(
            color:ColorManger.dividerColor,
          ),
              borderRadius: BorderRadius.circular(8)),
          child: RadioListTile(
            selectedTileColor: ColorManger.blueColor ,
            activeColor: ColorManger.blueColor,
            controlAffinity: ListTileControlAffinity.trailing,
            title: Text(StringManger.arabic,

              style: GoogleFonts.montserrat(
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                color:ColorManger.blackColor ,
              ),
            ),
            value: StringManger.arabic,
            groupValue: lang,
            onChanged: (value){
              setState(() {
                lang = value.toString();
              });
            },
          ),
        ),
      ],),
    ));
  }
}
