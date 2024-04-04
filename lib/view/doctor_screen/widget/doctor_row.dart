import 'package:fi_khedmtk_sehtak/shared/resources/asset_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorRow extends StatelessWidget {
  const DoctorRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.only(start: 26,end: 26,top: 35),
      child: Row(children: [

       GestureDetector(
           onTap: (){Navigator.pushNamed(context, Routes.detectionScreen);},
           child: CustomServiceItem(svgImage: AssetManger.detectionIcon, text: StringManger.detection)),
       SizedBox(width:18.w,),
       GestureDetector(
         onTap: (){Navigator.pushNamed(context, Routes.visitScreen);},
           child: CustomServiceItem(svgImage: AssetManger.visitLabsIcon, text: StringManger.visit)),
      ],),
    );
  }
}
