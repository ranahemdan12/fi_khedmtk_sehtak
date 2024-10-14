
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';

class EnterOtpText extends StatelessWidget {
  const EnterOtpText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Text(StringManger.enterDigit.tr(),
      style:Theme.of(context).textTheme.bodyLarge?.copyWith(color: ColorManger.grey0Color),);
  }
}
