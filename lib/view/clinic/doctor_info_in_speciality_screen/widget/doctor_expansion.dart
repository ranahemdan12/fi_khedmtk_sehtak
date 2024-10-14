import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/resources/color_manger.dart';
import '../../../../shared/resources/strings_manger.dart';



class DoctorExpansion extends StatefulWidget {
  const DoctorExpansion({super.key,required this.docItemModel});
  final ClinicsResultItem? docItemModel;

  @override
  State<DoctorExpansion> createState() => _DoctorExpansionState();
}

class _DoctorExpansionState extends State<DoctorExpansion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: ColorManger.blueLColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ExpansionTile(
            backgroundColor: ColorManger.blueLColor,
            title: Text(
              StringManger.aboutDoctor.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: ColorManger.blueColor),
            ),
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.only(
                    start: 15, top: 7, bottom: 13),
                child: Row(
                  children: [
                    Text(
                     widget. docItemModel?.doctor?.bio ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(
                          color: ColorManger.labelGrayColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 8.h,
        ),
        //subSpecialization
        Container(
          decoration: const BoxDecoration(
            color: ColorManger.blueLColor,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: ExpansionTile(
            expandedAlignment: Alignment.topRight,
            backgroundColor: ColorManger.blueLColor,
            title: Text(
              StringManger.subSpeciality.tr(),
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: ColorManger.blueColor),
            ),
            children: [
              Wrap(
                direction: Axis.horizontal,
                runSpacing: 5,
                // spacing: 4,
                children: List.generate(
                 widget. docItemModel?.doctor?.subSpecialization.length ?? 0,
                      (index) {
                    return Padding(
                      padding: const EdgeInsetsDirectional.only(start:16,end: 7, ),
                      child: Container(
                        padding: const EdgeInsetsDirectional.only(
                            top: 8, bottom: 9, start: 8, end: 8),
                        decoration: BoxDecoration(
                          color: ColorManger.whiteColor,
                          borderRadius: const BorderRadius.all(Radius.circular(12)),
                          border: Border.all(
                              color: ColorManger.blueDColor),

                        ),
                        child: Text(
                         widget. docItemModel?.doctor?.subSpecialization[index] ??
                              '',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(
                              color: ColorManger.labelGrayColor),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 14.h),
            ],
          ),
        ),
        SizedBox(
          height: 16.h,
        ),
      ],
    );
  }
}
