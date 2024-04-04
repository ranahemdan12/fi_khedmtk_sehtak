import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/view/clinic_details_screen/about_screen/widget/clinics_detais_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../select_area_screen/widget/clinics_container.dart';
import '../widget/about_container.dart';
import '../widget/specialist_details_container.dart';



class AboutClinicDetailsScreen extends StatelessWidget {
  const AboutClinicDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 5.h,),
        AboutContainer(),
        SizedBox(height:13.h,),
        ClinicsDetailsContainer(),
        SizedBox(height:13.h,),
        SpecialistDetailsContainer(),

      ],
    );
  }
}
