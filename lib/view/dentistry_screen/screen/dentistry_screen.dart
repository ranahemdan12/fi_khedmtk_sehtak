import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../widget/number_text.dart';

class DentistryScreen extends StatelessWidget {
  const DentistryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.dentistry,
        actionWidget:    IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),
        body:Column(




    ));
  }
}
