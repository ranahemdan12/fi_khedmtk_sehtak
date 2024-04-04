import 'package:flutter/material.dart';


import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';

import '../../doctor_screen/widget/custom_doctor_column.dart';


class ScanScreen extends StatelessWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.scan, body: Column(
      children: [
        CustomDetectionColumn(),
      ],
    ));
  }
}
