import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'lab_item.dart';


class LabsGridView extends StatelessWidget {
  const LabsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1371.h,
      child: Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
        child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.3,
          crossAxisSpacing: 9,
          mainAxisSpacing: 18,
        ), itemBuilder: (context, index){

          return LabItem();
        }),
      ),
    );
  }
}