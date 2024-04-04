import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../dermatology_screen/widget/derma_text1.dart';
import '../../dermatology_screen/widget/derma_text2.dart';
import '../../select_area_screen/widget/row_text.dart';
import '../widget/about_doctor_column.dart';
import '../widget/doctor_row_profile.dart';

class DoctorProfileScreen extends StatelessWidget {
  const DoctorProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.doctorProfile,
        actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),

        body: Padding(
          padding:EdgeInsetsDirectional.only(start: 26,end: 24),
          child: Column(children: [
            SizedBox(height: 20.h,),
            DoctorRowProfile(),
            SizedBox(height: 13.h,),
            Divider(color: ColorManger.whiteGreyColor,),
            SizedBox(height: 8.h,),
            AboutDoctorColumn(),


          ],),
        ));
  }
}
