import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';

class CustomHospitalsColumn extends StatelessWidget {
  const CustomHospitalsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(horizontal: 26),
      child: Column(
        children: [
          SizedBox(height: 35.h,),
          Row(children: [
            GestureDetector(onTap: (){Navigator.pushNamed(context, Routes.clinicServicesScreen);},
                child: CustomServiceItem(svgImage: AssetManger.clinicServicesIcon, text: StringManger.clinicsServices)),
            SizedBox(width: 19.w,),
            CustomServiceItem(svgImage: AssetManger.operationsIcon, text: StringManger.operations),
          ],),

          ],),


    );
  }
}
