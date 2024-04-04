import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/area_in_listview.dart';

class SelectAreaInScreen extends StatelessWidget {
  const SelectAreaInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text:StringManger.selectAreaIn,
        actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),)
        ,body: Column(children: [

          Expanded(child:AreaInListView(),),
        ],));
  }
}
