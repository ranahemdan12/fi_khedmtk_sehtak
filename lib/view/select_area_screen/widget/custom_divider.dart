import 'package:flutter/material.dart';

import '../../../shared/resources/color_manger.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 24),
      child: Divider(
        color: ColorManger.dividerColor,
      ),
    );
  }
}
