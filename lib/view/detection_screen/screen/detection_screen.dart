import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';

import '../../doctor_screen/widget/custom_doctor_column.dart';

class DetectionScreen extends StatelessWidget {
  const DetectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.doctor, body: Column(children: [
      CustomDetectionColumn(),
    ],));
  }
}
