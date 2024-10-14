import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../cubit/hospital_service_filter/hospital_service_filter_cubit.dart';

class ServiceFilterButton extends StatelessWidget {
  const ServiceFilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringManger.filter.tr(),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: ColorManger.blueColor),
        ),
        GestureDetector(
          onTap: () {
            HospitalServiceFilterCubit.get(context).resetTitle();
          },
          child: Text(
            StringManger.reset.tr(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: ColorManger.blueColor,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}
