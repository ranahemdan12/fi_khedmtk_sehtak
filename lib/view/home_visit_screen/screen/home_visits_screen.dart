import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../widget/request_container.dart';
import '../widget/row_works.dart';
import '../widget/work_container.dart';

class HomeVisitsScreen extends StatelessWidget {
  const HomeVisitsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.homeVisits, body: Padding(
      padding:EdgeInsetsDirectional.only(start: 26,end: 26),
      child: Column(

        children: [
          SizedBox(height: 21.h,),
          CustomRowLocation(),
          SizedBox(height: 21.h,),
          RequestContainer(),
          SizedBox(height: 19.h,),
          RowWorks(),
          SizedBox(height: 15.h,),
          WorkContainer(),



        ],
      ),
    ));
  }
}
