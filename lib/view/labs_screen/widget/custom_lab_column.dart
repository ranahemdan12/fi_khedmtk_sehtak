import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';

class CustomLabsColumn extends StatelessWidget {
  const CustomLabsColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 23),
      child: Column(
        children: [
          SizedBox(height: 35.h,),
          Row(
            children: [
              GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, Routes.homeVisitsScreen);
                  },
                  child: CustomServiceItem(svgImage: AssetManger.clinicServicesIcon, text: StringManger.homeVisits)),
              SizedBox(width: 19.w,),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, Routes.labsProvidersScreen);
                },


                  child: CustomServiceItem(svgImage: AssetManger.visitLabsIcon, text: StringManger.labs)),
            ],
          ),

        ],
      ),
    );
  }
}
