import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/hospitals/get_hospitals_branches_service.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';



class HospitalServiceCard extends StatelessWidget {
  const HospitalServiceCard({super.key,required this.branchServiceResultItem});

final BranchServiceResultItem branchServiceResultItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      decoration: BoxDecoration(
        color: ColorManger.whiteDColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManger.mainColor,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 16, top: 16, bottom: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  branchServiceResultItem
                      .services ??
                      '',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge
                      ?.copyWith(fontSize: 16),
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),
            Row(
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  text: TextSpan(
                    text: '${StringManger.actualFees.tr()}'
                        " : ",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                      color: ColorManger.blueColor,
                    ),
                    children: [
                      TextSpan(
                        text: branchServiceResultItem
                            .serviceFee ??
                            '',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                RichText(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  text: TextSpan(
                    text: '${StringManger.sehetakFees.tr()}'
                        " : ",
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(
                      color: ColorManger.blueColor,
                    ),
                    children: [
                      TextSpan(
                        text: branchServiceResultItem
                            .sehtakFee ??
                            '',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(
                            fontSize: 13,
                            color:
                            ColorManger.redColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 9.h,
            ),

          ],
        ),
      ),
    );
  }
}
