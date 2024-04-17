import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../scan_screen/widget/works_list_tile.dart';

class WorkContainer extends StatelessWidget {
  const WorkContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 495.h,
      width: 338.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: ColorManger.whiteGreyColor,
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 6,top: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            WorksListTile(svgPic: AssetManger.oneIcon, text: StringManger.chooseArea, textT: 'You can select the nearest branch to  you',),

            WorksListTile(svgPic: AssetManger.twoIcon, text: StringManger.addScans, textT: 'You can also book by prescription',),

            WorksListTile(svgPic: AssetManger.threeIcon, text: StringManger.selectScans, textT: 'Compare availability, prices , location & schedule',),

            WorksListTile(svgPic: AssetManger.fourIcon, text: StringManger.readService, textT: 'Follow the instructions before your scan visit',),

            WorksListTile(svgPic: AssetManger.fiveIcon, text: StringManger.selectDate, textT: 'Schedule your visit to scan center',),




          ],
        ),
      ),
    );
  }
}
