import 'package:fi_khedmtk_sehtak/view/service_screen/widget/service_grid_item.dart';
import 'package:flutter/material.dart';


class ServiceGridView extends StatelessWidget {
  const ServiceGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 26,end: 26,top: 35),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: 15,
          mainAxisSpacing: 22,
        ), itemBuilder: (context, index){

          return ServiceGridItem();
        }),
      ),
    );
  }
}
