import 'package:fi_khedmtk_sehtak/view/home_screen/widgets/package_item.dart';
import 'package:flutter/material.dart';

import '../../packages_screen/widget/package_item_list.dart';


class PackagesGridView extends StatelessWidget {
  const PackagesGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: 9,
          mainAxisSpacing: 18,
        ), itemBuilder: (context, index){
      
          return PackageItem();
        }),
      ),
    );
  }
}
