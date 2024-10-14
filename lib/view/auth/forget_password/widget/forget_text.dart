import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../shared/resources/strings_manger.dart';


class ForgetText extends StatelessWidget {
  const ForgetText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(StringManger.forgetPassword.tr(),
        style: Theme.of(context).textTheme.labelLarge,),
    );
  }
}
