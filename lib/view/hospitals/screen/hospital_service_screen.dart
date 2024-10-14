import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/navigation_service.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import '../../../models/response/hospitals/get_hospitals_branches.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/routes.dart';
import '../../../shared/statics/service_locator.dart';
import '../../clinic/doc_specialization_screen/widget/service_grid_item.dart';
import '../cubit/hospital_service_details/hospital_service_details_cubit.dart';



class HospitalServiceScreen extends StatefulWidget {
  const HospitalServiceScreen({super.key,});

  @override
  State<HospitalServiceScreen> createState() => _HospitalServiceScreenState();
}

class _HospitalServiceScreenState extends State<HospitalServiceScreen> {
  HospitalModel? hospitalResultItem;

  @override
  void didChangeDependencies() {
    hospitalResultItem = ModalRoute.of(context)!.settings.arguments as HospitalModel?;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.services.tr(),
        body:hospitalResultItem==null?  Center(child: Image.asset("assets/images/noData.png")): Padding(
          padding: const EdgeInsetsDirectional.only(start: 26, end: 26, top: 35),
          child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 159 / 142,
              crossAxisSpacing: 20,
              mainAxisSpacing: 16,
            ),
            children: [
              if (hospitalResultItem?.lab == true)
                ServiceGridItem(
                  serviceIcon: AssetManger.labsIcon,
                  serviceText: StringManger.labsHospital.tr(),
                  hospitalServiceEnum: HospitalServiceEnum.labs,
                  onTap: () {
                    HospitalServiceDetailsCubit.get(context)
                        .hospitalServiceEnum = HospitalServiceEnum.labs;
                    sl<NavigationService>().navigateTo(
                      Routes.hospitalServicesDetails,
                    );
                  },
                ),
              if (hospitalResultItem?.scans == true)
                ServiceGridItem(
                  serviceIcon: AssetManger.scanIcon,
                  serviceText: StringManger.scans.tr(),
                  onTap: () {
                    HospitalServiceDetailsCubit.get(context)
                        .hospitalServiceEnum = HospitalServiceEnum.scanners;
                    sl<NavigationService>().navigateTo(
                      Routes.hospitalServicesDetails,
                    );
                  },
                ),
              if (hospitalResultItem?.clinic == true)
                ServiceGridItem(
                  serviceIcon: AssetManger.hosClinicsIcon,
                  serviceText: StringManger.clinics.tr(),
                  onTap: () {
                    HospitalServiceDetailsCubit.get(context)
                        .hospitalServiceEnum = HospitalServiceEnum.clinics;
                    sl<NavigationService>().navigateTo(
                      Routes.hospitalClinicSpecialization,
                    );
                  },
                ),
              if (hospitalResultItem?.operations == true)
                ServiceGridItem(
                  serviceIcon: AssetManger.hosOperationIcon,
                  serviceText: StringManger.operations.tr(),
                  onTap: () {
                    HospitalServiceDetailsCubit.get(context)
                        .hospitalServiceEnum = HospitalServiceEnum.operations;
                    sl<NavigationService>().navigateTo(
                      Routes.hospitalServicesDetails,
                    );
                  },
                ),
            ],
          ),
        )
    );
  }
}
