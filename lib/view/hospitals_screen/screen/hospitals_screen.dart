import 'package:flutter/material.dart';


import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/custom_hospitals_column.dart';


class HospitalsScreen extends StatelessWidget {
  const HospitalsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomScreen(text: StringManger.hospitals, body: Column(children: [
      CustomHospitalsColumn(),
    ],));

  }
}
