import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/view/home_screen/widgets/service_row_item.dart';
import 'package:flutter/material.dart';
import '../../../models/response/clinic/get_specialization/get_specialization.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/routes.dart';



class ServiceGridView extends StatelessWidget {
   ServiceGridView({Key? key}) : super(key: key);
  SpecializationResponseModel? speciality;
  @override
  Widget build(BuildContext context) {

    return Expanded(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        child: GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 114 / 124,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
          ),
          children: [
            ServiceRowItem(
              serviceIcon: AssetManger.doctorIcon,
              serviceText: StringManger.doctor.tr(),
              navToScreen: Routes.specializationScreen,
            ),
            ServiceRowItem(/*tab: SelectedTab.hospitals,*/
              serviceIcon: AssetManger.hospitalsIcon,
              serviceText: StringManger.hospitals.tr(),
              navToScreen: Routes.hospitalsNamesScreen,
            ),
            ServiceRowItem(

              serviceIcon: AssetManger.labsIcon,
              serviceText: StringManger.labsScan.tr(),
              navToScreen: Routes.labScanScreen,
            ),
            ServiceRowItem(
              serviceIcon: AssetManger.pharmacyIcon,
              serviceText: StringManger.pharmacy.tr(),
              navToScreen: Routes.pharmacyScreen,
              // arguments: MapTypeEnum.pharmacy,
            ),
            ServiceRowItem(
              serviceType: ServiceType.therapies,
              serviceIcon: AssetManger.physicalTherapyIcon,
              serviceText: StringManger.physicalTherapy.tr(),
              navToScreen: Routes.labsServicesScreen,
            ),
            ServiceRowItem(
              serviceIcon: AssetManger.dentistIcon,
              serviceText: StringManger.dentist.tr(),
              navToScreen: Routes.doctorsScreen,


            ),
          ],
        ),
      ),
    );
  }
}
