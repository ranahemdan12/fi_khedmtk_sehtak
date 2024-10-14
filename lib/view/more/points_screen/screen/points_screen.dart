import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../shared/resources/strings_manger.dart';
import '../../../../shared/statics/reusable_component.dart';
import '../widget/container_widget.dart';

class PointsScreen extends StatelessWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.points.tr(), body: Padding(
      padding: const EdgeInsetsDirectional.only(top: 21,start: 26,end: 26),
      child: Column(children: [

        const PointsContainer(),
        SizedBox(height: 33.h,),


      ],),
    ));
  }
}
