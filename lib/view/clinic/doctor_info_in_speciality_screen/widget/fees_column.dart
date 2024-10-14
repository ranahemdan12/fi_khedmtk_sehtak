import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';

class FeesColumn extends StatelessWidget {
  const FeesColumn({super.key,required this.docItemModel});
  final ClinicsResultItem? docItemModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24.h,
        ),
        Row(
          children: [
            Text(
              StringManger.fees.tr(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(
                  fontSize: 14.sp,
                  color: ColorManger.blueColor),
            ),
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              StringManger.examinationPrice.tr(),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: ColorManger.blueColor),
            ),

          ],
        ),
        SizedBox(
          height: 7.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: StringManger.actualFees.tr(),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(
                    color: ColorManger.blueColor,
                    fontSize: 12.sp),
                children: [
                  TextSpan(
                    text: ":" "${docItemModel?.examinationFees}",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
            // RichText(
            //   text: TextSpan(
            //     text: StringManger.actualFees.tr(),
            //     style: Theme.of(context)
            //         .textTheme
            //         .labelMedium
            //         ?.copyWith(
            //             color: ColorManger.blueColor,
            //             fontSize: 12.sp),
            //     children: [
            //       TextSpan(
            //         text: ":" "${docItemModel?.followUpFees}",
            //         style: Theme.of(context)
            //             .textTheme
            //             .labelLarge
            //             ?.copyWith(fontSize: 11),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        SizedBox(
          height: 5.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: StringManger.sehetakFees.tr(),
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(
                    color: ColorManger.blueColor,
                    fontSize: 12.sp),
                children: [
                  TextSpan(
                    text: ":" "${docItemModel?.sehtakFees}",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(
                        fontSize: 13,
                        color: ColorManger.redColor),
                  ),
                ],
              ),
            ),
            // RichText(
            //   text: TextSpan(
            //     text: StringManger.sehetakFees.tr(),
            //     style: Theme.of(context)
            //         .textTheme
            //         .labelMedium
            //         ?.copyWith(
            //             color: ColorManger.blueColor,
            //             fontSize: 12.sp),
            //     children: [
            //       TextSpan(
            //         text: ":" "${docItemModel?.sehtakFees}",
            //         style: Theme.of(context)
            //             .textTheme
            //             .labelLarge
            //             ?.copyWith(
            //                 fontSize: 13,
            //                 color: ColorManger.redColor),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
        // ListTile(
        //   contentPadding:
        //   const EdgeInsetsDirectional.only(start: 0),
        //   leading: Image.asset(AssetManger.coinPng),
        //   title: Text(
        //     "${StringManger.youWill.tr()}"
        //         "${docItemModel?.sehtakFees}"
        //         "${StringManger.pointsAfter.tr()}",
        //     overflow: TextOverflow.ellipsis,
        //     maxLines: 1,
        //     style: Theme.of(context).textTheme.labelMedium,
        //   ),
        // ),
      ],
    );
  }
}
