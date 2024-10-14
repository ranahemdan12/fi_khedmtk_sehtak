import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/view/labs/widgets/price_radio_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/color_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/navigation_service.dart';
import '../../../shared/statics/reusable_component.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../orders_screen/cubit/labs_reservation/labs_reservation_cubit.dart';
import '../../select_region_screen/cubit/region_cubit.dart';
import '../cubit/lab_filtter_cubit/labs_filtter_cubit.dart';
import '../cubit/labs_cubit/labs_cubit.dart';
import 'lab_fees_slider.dart';

class LabBranchSheet extends StatelessWidget {
  const LabBranchSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 390.w,
      child: Padding(
        padding: const EdgeInsetsDirectional.only(start: 16, end: 28),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 23.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringManger.filter.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelSmall
                        ?.copyWith(color: ColorManger.blueColor),
                  ),
                  GestureDetector(
                    onTap: () {

                      double min = LabsCubit.get(context)
                          .labsBranches
                          .minSehtakFees ??
                          0;
                      double max = LabsCubit.get(context)
                          .labsBranches
                          .maxSehtakFees ??
                          0.0;

                      LabsFilterCubit.get(context)
                          .resetAllFilter(minFees: min, maxFees: max,);
                      RegionCubit.get(context). resetSelectedCityRegion();
                    },
                    child: Text(
                      StringManger.reset.tr(),
                      style:
                      Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: ColorManger.blueColor,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  sl<NavigationService>()
                      .navigateTo(Routes.governorateScreen);
                },
                child: Container(
                  width: 346.w,
                  height: 51.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: ColorManger.whiteTColor,
                    border: Border.all(
                        color: ColorManger.whiteGreyColor, width: 1),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 16, end: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringManger.selectCityRegion.tr(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                              fontSize: 14.sp,
                              color: ColorManger.greyFColor),
                        ),
                        SvgPicture.asset(
                          AssetManger.arrowIcon,
                          matchTextDirection: true,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
              // GestureDetector(
              //   onTap: () {
              //     sl<NavigationService>().navigateTo(Routes.map,
              //         arguments:
              //         LabsReservationCubit.get(context).serviceType == ServiceType.lab ? MapTypeEnum.labs
              //             :   LabsReservationCubit.get(context).serviceType == ServiceType.scan?MapTypeEnum.scan
              //             : MapTypeEnum.physical);
              //   },
              //   child: Container(
              //     width: 346.w,
              //     height: 51.h,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(10),
              //       color: ColorManger.whiteTColor,
              //       border: Border.all(
              //           color: ColorManger.whiteGreyColor, width: 1),
              //     ),
              //     child: Padding(
              //       padding: const EdgeInsetsDirectional.only(
              //           start: 16, end: 14),
              //       child: Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           Text(
              //             StringManger.map.tr(),
              //             style: Theme.of(context)
              //                 .textTheme
              //                 .titleSmall
              //                 ?.copyWith(
              //                 fontSize: 14.sp,
              //                 color: ColorManger.greyFColor),
              //           ),
              //           SvgPicture.asset(
              //             AssetManger.arrowIcon,
              //             matchTextDirection: true,
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: 18.h,
              ),
              Padding(
                padding: const EdgeInsetsDirectional.only(start: 32),
                child: Row(
                  children: [
                    Text(
                      StringManger.fees.tr(),
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium
                          ?.copyWith(color: ColorManger.blueColor),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: ColorManger.dividerColor,
              ),
              SizedBox(
                height: 10.h,
              ),
              const LabsFeesSlider(),
              const PriceRadioTile(),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: const Size(346, 37),
                      backgroundColor: ColorManger.blueColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  onPressed: () {

                    if (LabsFilterCubit.get(context).validate(
                      city: RegionCubit.get(context).selectedCity?.id,
                      region: RegionCubit.get(context).selectedRegion?.id,)
                    ) {
                      LabsCubit.get(context).getLabs(
                          city: RegionCubit.get(context).selectedCity?.id,
                          region: RegionCubit.get(context).selectedRegion?.id,
                          maxFees: double.tryParse(LabsFilterCubit.get(context).maxFees?.toStringAsFixed(2)??'0.0'),
                          minFees:double.tryParse(LabsFilterCubit.get(context).minFees?.toStringAsFixed(2)??'0.0'),
                          orderBy: LabsFilterCubit.get(context).orderBy,
                          reset: true);
                      sl<NavigationService>().pop();
                    } else {
                      showToast(StringManger.noValueSelected.tr());
                    }
                  },
                  child: Text(
                    StringManger.done.tr(),
                    style: Theme.of(context).textTheme.titleMedium,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
