import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';

class ServiceProvider extends StatelessWidget {
  const ServiceProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScreen(text: 'Service Provider',
      actionWidget:IconButton(onPressed: (){},icon: SvgPicture.asset(AssetManger.searchIcon),),
        body: Column(
      children: [
        SizedBox(height: 14.h,),

      ],
    ));
  }
}
