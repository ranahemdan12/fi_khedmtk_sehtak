import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';



class DentistScreen extends StatelessWidget {
  const DentistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
      text: StringManger.dentist.tr(),
        body: Column());
  }
}
