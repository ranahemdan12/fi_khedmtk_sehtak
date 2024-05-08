import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';

import '../../../shared/resources/strings_manger.dart';
import '../widget/hospitalsnames_List_view.dart';

class HospitalsNamesScreen  extends StatelessWidget {
  const HospitalsNamesScreen ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.hospitals, body: Column (
      children:[
        Expanded(child: HospitalsNamesListView(),),
      ],
    ));
  }
}
