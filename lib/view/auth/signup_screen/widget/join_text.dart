
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';


class JoinText extends StatelessWidget {
  const JoinText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Text(
      StringManger.joinedUs.tr(),
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
      color: ColorManger.blackColor,



      ),
    );
  }
}
