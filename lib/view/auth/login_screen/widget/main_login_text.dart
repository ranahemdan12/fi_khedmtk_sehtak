import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../shared/resources/strings_manger.dart';


class MainLoginText extends StatelessWidget {
  const MainLoginText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      StringManger.login.tr(),
      style: Theme.of(context).textTheme.labelLarge
    );
  }
}
