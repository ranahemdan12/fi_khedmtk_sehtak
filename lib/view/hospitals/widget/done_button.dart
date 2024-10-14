import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/service_locator.dart';
import '../../select_region_screen/cubit/region_cubit.dart';
import '../cubit/hospital_cubit/hospitals_cubit.dart';
import '../cubit/hospital_fiter_cubit/hospital_filter__cubit.dart';

class DoneButton extends StatelessWidget {
  const DoneButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          StringManger.filter.tr(),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: Theme.of(context)
              .textTheme
              .labelSmall
              ?.copyWith(color: ColorManger.blackColor),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              minimumSize: const Size(40, 27),
              backgroundColor: ColorManger.blueColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              )),
          onPressed: () {

            if (HospitalFilterCubit.get(context).validate(

                region: RegionCubit.get(context).selectedRegion?.id,
                city: RegionCubit.get(context).selectedCity
                    ?.id)) {
              HospitalsCubit.get(context).getHospitalsBranches(
                city: RegionCubit.get(context)
                    .selectedCity
                    ?.id,
                region: RegionCubit.get(context).selectedRegion?.id,
                reset: true,
              );

              sl<NavigationService>().pop();
            } else {
              showToast(StringManger.noValueSelected.tr());
            }
          },
          child: Text(
            StringManger.done.tr(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        )
      ],
    );
  }
}
