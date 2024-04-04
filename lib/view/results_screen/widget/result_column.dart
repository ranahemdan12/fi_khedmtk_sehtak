import 'package:fi_khedmtk_sehtak/view/results_screen/widget/result_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';


class ResultColumn extends StatelessWidget {
  const ResultColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ResultItem(text: StringManger.analysis, svgImage: AssetManger.analysisIcon),
            SizedBox(width: 36.w,),
            ResultItem(text:  StringManger.scans, svgImage: AssetManger.scansIcon),
        ],
      ),
      ],

    );
  }
}
