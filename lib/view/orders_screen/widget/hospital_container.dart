import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/hospitals/get_hospital_reservation.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';



class HospitalContainer extends StatelessWidget {
  const HospitalContainer({super.key,required this.hospitalReservationItem});
  final HospitalReservationItem?hospitalReservationItem;

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
              hospitalReservationItem?.name ??
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
                    text: hospitalReservationItem
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
                    '${ hospitalReservationItem?.branchCity}'
                        ","
                        '${hospitalReservationItem?.branchRegion}',
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
                    text:hospitalReservationItem
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
              height: 8.h,
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
                    text: hospitalReservationItem?.sehtakFee
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
