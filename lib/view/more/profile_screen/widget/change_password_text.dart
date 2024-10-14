import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileChangePasswordText extends StatelessWidget {
   ProfileChangePasswordText({super.key,required this.text});
 String?text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 29.h,),
        Row(
          children: [
            Text(
              text!,
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ],
        ),
        SizedBox(
          height: 9.h,
        ),
      ],
    );
  }
}
