import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/container_widget.dart';
import '../widget/point_container2.dart';
import '../widget/points_row.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.points, body: Padding(
      padding: EdgeInsetsDirectional.only(top: 21,start: 26,end: 26),
      child: Column(children: [

        PointsContainer(),
        SizedBox(height: 33.h,),
        RowPoints(),
        SizedBox(height: 22.h,),
        PointsContainer2(),
        SizedBox(height:13.h,),
        PointsContainer2(),
        SizedBox(height:13.h,),
        PointsContainer2(),

      ],),
    ));
  }
}
