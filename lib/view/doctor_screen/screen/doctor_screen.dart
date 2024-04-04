import 'package:flutter/material.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/custom_doctor_column.dart';
import '../widget/custom_doctor_column.dart';
import '../widget/doctor_row.dart';

class DoctorScreen extends StatelessWidget {
  const DoctorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(

      text: StringManger.doctor,

        body: Column(
          children: [
            DoctorRow(),
          ],
        ), );


  }
}
