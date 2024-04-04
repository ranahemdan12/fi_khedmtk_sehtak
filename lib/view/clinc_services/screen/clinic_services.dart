import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';

import '../../../shared/statics/reusable_component.dart';
import '../../doctor_screen/widget/custom_doctor_column.dart';


class ClinicServices extends StatelessWidget {
  const ClinicServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.clinicsServices,
        actionWidget: IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),

        body: Column(
          children: [
            CustomDetectionColumn(),
          ],
        ));
  }
}
