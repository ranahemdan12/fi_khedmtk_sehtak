import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/custom_lab_column.dart';


class LabsScreen extends StatelessWidget {
  const LabsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.labs, body: Column(children: [

            CustomLabsColumn(),]),
        );

  }
}