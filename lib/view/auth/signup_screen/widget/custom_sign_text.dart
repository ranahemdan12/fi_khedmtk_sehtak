import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/resources/color_manger.dart';


class CustomSignupText extends StatelessWidget {
   CustomSignupText({Key? key,
   required this.text,}) : super(key: key);

   String text;

  @override
  Widget build(BuildContext context) {
    return Text(text,
    style: Theme.of(context).textTheme.labelLarge?.copyWith(
      color: ColorManger.labelGrayColor,
      fontSize: 18.sp,
    ),
  );
  }
}
