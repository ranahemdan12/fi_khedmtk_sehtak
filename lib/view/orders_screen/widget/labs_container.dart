import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/labs/reserve_lab_service_response.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';



class LabsContainer extends StatelessWidget {
  const LabsContainer({super.key,required this.reserve});
  final ReserveLabServiceSuccessResponse? reserve;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 358.w,
      // height: 212.h,
      decoration: BoxDecoration(
        color: ColorManger.whiteDColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: ColorManger.mainColor,
        ),
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.only(
            start: 16, end: 16, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              reserve?.labName ??
                  '',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 8.h,
            ),
            RichText(
              text: TextSpan(
                text: '${StringManger.serviceName.tr()}'
                    ': ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  color: ColorManger.blueColor,
                ),
                children: [
                  TextSpan(
                    text: reserve
                        ?.serviceName ??
                        '',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                        color:
                        ColorManger.blackColor,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            RichText(
              text: TextSpan(
                text:
                '${StringManger.location.tr()}' ': ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  color: ColorManger.blueColor,
                ),
                children: [
                  TextSpan(
                    text:
                    '${reserve?.branchCity}'
                        ","
                        '${reserve?.branchRegion}',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                        color:
                        ColorManger.blackColor,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 9.h,
            ),
            RichText(
              text: TextSpan(
                text: '${StringManger.status.tr()}' ': ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  color: ColorManger.blueColor,
                ),
                children: [
                  TextSpan(
                    text: reserve
                        ?.reservationStatus,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                        color:
                        ColorManger.blackColor,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(
              height:10.h,
            ),
            RichText(
              text: TextSpan(
                text:
                '${StringManger.consultationFees.tr()}'
                    ': ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  color: ColorManger.blueColor,
                ),
                children: [
                  TextSpan(
                    text: reserve?.sehtakFee
                        .toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium
                        ?.copyWith(
                        color:
                        ColorManger.blackColor,
                        fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
