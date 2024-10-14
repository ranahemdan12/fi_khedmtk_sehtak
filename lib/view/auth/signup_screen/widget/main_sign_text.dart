
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/resources/strings_manger.dart';



class MainSignUpText extends StatelessWidget {
  const MainSignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      StringManger.createNewAccount.tr(),

      style:Theme.of(context).textTheme.labelLarge,
    );
  }
}
