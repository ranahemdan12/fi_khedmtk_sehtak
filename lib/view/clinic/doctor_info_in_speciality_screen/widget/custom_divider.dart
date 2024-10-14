import 'package:flutter/material.dart';
import '../../../../shared/resources/color_manger.dart';


class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Divider(
      color: ColorManger.dividerColor,
    );
  }
}
