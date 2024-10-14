
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/routes.dart';


class LoginText extends StatelessWidget {
  const LoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(
          context,
          Routes.loginScreen,
        );
      },
      child: Text(
        StringManger.login.tr(),
        style:  Theme.of(context).textTheme.displaySmall?.copyWith(
    color: ColorManger.blueColor,



      ),),
    );
  }
}
