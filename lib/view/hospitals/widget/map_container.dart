import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';

class MapContainer extends StatelessWidget {
  const MapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        sl<NavigationService>().navigateTo(Routes.map,
            arguments: MapTypeEnum.hospitals);
      },
      child: Container(
        width: 346.w,
        height: 51.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManger.whiteTColor,
          border: Border.all(
              color: ColorManger.whiteGreyColor, width: 1),
        ),
        child: Padding(
          padding:
          const EdgeInsetsDirectional.only(start: 16, end: 14),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringManger.map.tr(),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(
                    fontSize: 14.sp,
                    color: ColorManger.greyFColor),
              ),
              SvgPicture.asset(
                AssetManger.arrowIcon,
                matchTextDirection: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
