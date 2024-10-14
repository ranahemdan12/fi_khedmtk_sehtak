import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/service_locator.dart';
import '../../clinic/doctor_info_in_speciality_screen/widget/custom_divider.dart';
import '../cubit/hospital_service_details/hospital_service_details_cubit.dart';
import '../cubit/hospital_service_filter/hospital_service_filter_cubit.dart';
import 'doctor_radio_tile.dart';

class ShowSheetColumn extends StatelessWidget {
  const ShowSheetColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 32.w,
            ),
            Text(
              StringManger.doctorTitle.tr(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(color: ColorManger.greyFColor),
            ),
          ],
        ),
        SizedBox(
          height: 6.h,
        ),
        const CustomDivider(),
        SizedBox(
          height: 12.h,
        ),
        const DoctorTitleRadioTile(),
        SizedBox(
          height: 9.h,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(80, 37),
              backgroundColor: ColorManger.blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: () {
            if (HospitalServiceFilterCubit.get(context).validate()) {
              HospitalServiceDetailsCubit.get(context)
                  .getHospitalsServiceBranches(
                title: HospitalServiceFilterCubit.get(context).title,
                reset: true,
              );

              sl<NavigationService>().pop();
            } else {
              showToast(StringManger.noValueSelected.tr());
            }
          },
          child: Text(
            StringManger.done.tr(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}
