import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';

class DoneText extends StatelessWidget {
  const DoneText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      StringManger.done.tr(),
      style: Theme.of(context).textTheme.displaySmall?.copyWith(
        color: ColorManger.whiteColor,
      ),
    );
  }
}
