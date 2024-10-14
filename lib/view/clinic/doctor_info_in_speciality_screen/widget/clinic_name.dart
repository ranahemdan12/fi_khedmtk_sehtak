import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../models/response/clinic/get_clinics_by_speciality/get_clinics_by_spsciality.dart';
import '../../../../shared/resources/color_manger.dart';



class ClinicName extends StatelessWidget {
  const ClinicName({super.key,required this.docItemModel});
  final ClinicsResultItem? docItemModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              docItemModel?.clinicName ?? '',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Text(
              '${docItemModel?.city}' ',' '${docItemModel?.region}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium
                  ?.copyWith(color: ColorManger.greyLColor),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
