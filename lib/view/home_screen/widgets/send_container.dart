import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/routes.dart';

class SendContainer extends StatelessWidget {
  const SendContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68.h,
      width: 338.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color:ColorManger.whiteBlueColor,
      ),
      child: GestureDetector(
        onTap: (){Navigator.pushNamed(context, Routes.addPresScreen);},
        child: Padding(
          padding:const EdgeInsetsDirectional.only(start: 17),
          child: Row(children: [
            SvgPicture.asset(AssetManger.pdfIcon),
            SizedBox(width: 8.w,),
            Text(
              StringManger.sendPresc.tr(),
              style: Theme.of(context).textTheme.titleLarge),
          ],),
        ),
      ),
    );
  }
}
