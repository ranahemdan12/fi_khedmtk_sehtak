import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../models/response/clinic/get_doctor_reservation/get_doctor_reservation.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';



class DoctorContainer extends StatefulWidget {
  const DoctorContainer({super.key,required this.doctorReservationItem});
  final DoctorReservationItem doctorReservationItem;

  @override
  State<DoctorContainer> createState() => _DoctorContainerState();
}

class _DoctorContainerState extends State<DoctorContainer> {

  String  subSpecializationFunction(List<String> subClinics){
    String sub='';
    for (String element in (subClinics)) {
      sub = element==subClinics.last?     '$sub$element . ':'$sub$element ,';
    }
    return sub;
  }

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
              widget.doctorReservationItem.doctorName ??
                  '',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              '${widget.doctorReservationItem.specialization}'
                  "  "
                  "${subSpecializationFunction(widget.doctorReservationItem.subSpecialization )}", // '${state.reservation?[index].subSpecialization}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(
                  fontSize: 13,
                  color:
                  ColorManger.labelGrayColor),
            ),
            SizedBox(
              height: 13.h,
            ),
            RichText(
              text: TextSpan(
                text: '${StringManger.clinicName.tr()}'
                    ': ',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(
                  color: ColorManger.blueColor,
                ),
                children: [
                  TextSpan(
                    text: widget.doctorReservationItem
                        .clinicName ??
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
                    '${widget.doctorReservationItem.clinicCity}'
                        ","
                        '${widget.doctorReservationItem.clinicRegion}',
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
                    text:widget.doctorReservationItem
                        .reservationStatus,
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
                    text: widget.doctorReservationItem.sehtakFees
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
