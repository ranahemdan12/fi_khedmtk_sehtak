import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/statics/routes.dart';

class PackageItem extends StatelessWidget {
  const PackageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.pushNamed(context,  Routes.packageItemScreen);},
      child: Container(
        width: 161.w,
        height: 134.h,
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10),
        //   border: Border.all(
        //     color: ColorManger.whiteGreenColor,
        //     width: 1.w,
        //   ),
        // ),
        child: Image.asset(AssetManger.packageItemIcon),
      ),
    );
  }
}
