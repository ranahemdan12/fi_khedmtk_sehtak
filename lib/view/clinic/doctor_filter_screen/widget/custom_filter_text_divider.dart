import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/resources/color_manger.dart';

//ignore: must_be_immutable
class CustomFilterTextDivider extends StatelessWidget {
  CustomFilterTextDivider({required this.text,super.key});
  String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 32),
              child: Text(text,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                  color: ColorManger.blueColor,

                ),

              ),
            ),
          ],
        ),
        SizedBox(height: 8.h,),
        const Padding(
          padding:EdgeInsetsDirectional.only(start: 16,end: 28),
          child: Divider(
            color: ColorManger.dividerColor,
          ),
        ),
      ],
    );
  }
}
