import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/view/auth/login_screen/widget/signup_text.dart';
import 'package:flutter/material.dart';
import '../../../../shared/resources/strings_manger.dart';



class DontHaveText extends StatelessWidget {
  const DontHaveText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          StringManger.donothaveAccount.tr(),
          style:Theme.of(context).textTheme.displayMedium?.copyWith(color: ColorManger.blackColor),
          ),

        SignUpText(text: StringManger.signUp.tr(),),
      ],
    );
  }
}
