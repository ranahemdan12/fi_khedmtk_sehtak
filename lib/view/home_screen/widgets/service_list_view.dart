import 'package:fi_khedmtk_sehtak/view/home_screen/widgets/service_list_item.dart';
import 'package:flutter/material.dart';


class ListViewService extends StatelessWidget {
  const ListViewService({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 110,
      child: Padding(
        padding:  EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
            itemBuilder: (context,index)=>ServiceItem(),
          itemCount: 6,
        ),
      ),
    );
  }
}
