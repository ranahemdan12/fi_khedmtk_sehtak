import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';
import '../../scan_screen/widget/scan_container.dart';
import '../../scan_screen/widget/works_container.dart';

class OperationsScreen extends StatelessWidget {
  const OperationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.operations,
        actionWidget: IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AssetManger.searchIcon),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 21.h,
            ),
            CustomRowLocation(),
            ScanContainer(svgPic: AssetManger.discountIcon, text: StringManger.discountShamel,textT: StringManger.details,onTab: (){
              Navigator.pushNamed(context, Routes.shamelScreen);


            },),
            SizedBox(
              height: 21.h,
            ),

            WorksContainer(),
          ],
        ));
  }
}
