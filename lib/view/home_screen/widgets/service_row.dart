import 'package:fi_khedmtk_sehtak/view/home_screen/widgets/service_row_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';

class ServiceRow extends StatelessWidget {
  const ServiceRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsetsDirectional.symmetric(horizontal: 16),
      child: Row(
        children: [
          GestureDetector(onTap: (){
            Navigator.pushNamed(context,Routes.doctorScreen);
          },
              child: ServiceRowItem(svgImage: AssetManger.doctorIcon, text: StringManger.doctor)),
          SizedBox(width: 7.w,),
          GestureDetector(onTap: (){
            Navigator.pushNamed(context, Routes.hospitalsNamesScreen);
          },
              child: ServiceRowItem(svgImage: AssetManger.hospitalsIcon, text: StringManger.hospitals)),
          SizedBox(width: 7.w,),
          GestureDetector(onTap: (){
            Navigator.pushNamed(context, Routes.labsScreen);

          },
              child: ServiceRowItem(svgImage: AssetManger.labsIcon, text: StringManger.labs)),

        ],
      ),
    );
  }
}
