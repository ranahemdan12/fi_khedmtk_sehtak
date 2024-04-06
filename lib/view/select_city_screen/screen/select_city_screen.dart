import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../widget/city_list_view.dart';

class SelectCityScreen extends StatelessWidget {
  const SelectCityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.selectCity,
        actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),)
        ,body: Column(children: [

          Expanded(child: CityListView(),),
        ],));
  }
}
