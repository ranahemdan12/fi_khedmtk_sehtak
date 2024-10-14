
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/resources/strings_manger.dart';



class ResetPassText extends StatelessWidget {
  const ResetPassText({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(StringManger.resetPass.tr(),
        style: Theme.of(context).textTheme.labelLarge,),
    );
  }
}
