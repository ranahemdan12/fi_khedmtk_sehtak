import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../widget/dermatology_column.dart';


class DermatologyScreen extends StatelessWidget {
  const DermatologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: StringManger.dermatology,
        actionWidget:  IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),body:Padding(
      padding: EdgeInsetsDirectional.only(start: 26,end: 26),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 13.h,),
            DermatologyColumn(),
            SizedBox(height:20.h,),

            DermatologyColumn(),
            SizedBox(height: 20.h,),

            DermatologyColumn(),
        
        
          ],
        ),
      ),
    ));
  }
}
