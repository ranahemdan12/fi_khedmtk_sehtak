import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/result_column.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.results, body:Center(
      child: Column(children: [

        SizedBox(height: 22.h,),
        ResultColumn(),
        SizedBox(height: 177.h,),
        Image.asset(AssetManger.orderAnimation),
        SizedBox(height: 27.h,),
        Text(StringManger.noResultYet,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: ColorManger.labelGrayColor,
          ),
        ),

      ],),
    ));
  }
}
