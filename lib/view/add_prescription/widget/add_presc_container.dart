import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/color_manger.dart';

class AddPrescContainer extends StatelessWidget {
  const AddPrescContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 338.w,
      height: 187.h,

      decoration: BoxDecoration(
        color: ColorManger.whiteDColor,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
