import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/view/select_area_screen/widget/custom_divider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../widget/clinic_details_column.dart';
import '../widget/clinics_details_tabbar.dart';
import '../widget/details_container.dart';

class ClinicDetailsScreen extends StatelessWidget {
  const ClinicDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.selectArea, body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
        child: Center(
          child: Column(


            children: [

              SizedBox(height: 26.h,),
              ClinicDetailsColumn(),
              SizedBox(height: 5.h,),
              Divider(color: ColorManger.whiteGreyColor,),
              SizedBox(height: 7.h,),
              DetailsContainer(),
              SizedBox(height: 13.h,),
              Padding(
                padding:EdgeInsetsDirectional.symmetric(horizontal: 20),
                child: CustomButton(text: StringManger.bookYourAppointment, onPressed: (){}),
              ),
              ClinicDetailsTabBar(),
            ],
          ),
        ),
      ),
    ));
  }
}
