
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../../shared/resources/color_manger.dart';
import '../../../../../shared/resources/strings_manger.dart';


class ChangePasswordText extends StatelessWidget {
  const ChangePasswordText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Center(
      child: Text(StringManger.changePassword.tr(),

        style:  Theme.of(context).textTheme.displayLarge?.copyWith(
          color: ColorManger.blackColor,
      )
        ,),
    );
  }
}