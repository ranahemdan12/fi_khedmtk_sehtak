import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';




import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';


import '../widget/custom_column.dart';

class VisitScreen extends StatelessWidget {
  const VisitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CustomScreen(text: StringManger.visit,


        body: Column(
      children: [CustomVisitColumn(),],
    ));

  }
}
