import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';

class CustomDetectionColumn extends StatelessWidget {
  const CustomDetectionColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Column(
        children: [
          SizedBox(height: 35.h,),
          Row(children: [
            GestureDetector(onTap: (){Navigator.pushNamed(context, Routes.dermatologyScreen);},
                child: CustomServiceItem(svgImage: AssetManger.dermatologyIcon, text: StringManger.dermatology)),
            SizedBox(width: 19.w,),
            CustomServiceItem(svgImage: AssetManger.neurologyIcon, text: StringManger.neurology),

          ],),
          SizedBox(height: 16.h,),
          Row(children: [
            CustomServiceItem(svgImage: AssetManger.psychIcon, text: StringManger.psychiatry),
            SizedBox(width: 19.w,),
            CustomServiceItem(svgImage: AssetManger.internalMedicalIcon, text: StringManger.internalMedical),

          ],),
          SizedBox(height: 16.h,),
          Row(children: [
            CustomServiceItem(svgImage: AssetManger.orthroIcon, text: StringManger.orthopedics),
            SizedBox(width: 19.w,),

          ],),
        ],
      ),
    );
  }
}
