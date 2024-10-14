import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/statics/reusable_component.dart';
import 'package:flutter/material.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../../shared/resources/strings_manger.dart';
import '../../../shared/statics/enum.dart';
import '../../../shared/statics/routes.dart';
import '../widgets/lab_scan_item.dart';



class LabScanScreen extends StatelessWidget {
  const LabScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScreen(
        text: StringManger.labsScan.tr(),
        body: Padding(
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 26,vertical: 35),
          child: GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 159 / 142,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            children: [
              LabScanItem(
                serviceType: ServiceType.lab,
                serviceIcon: AssetManger.labsIcon,
                serviceText: StringManger.labs.tr(),
                navToScreen: Routes.labsServicesScreen,
              ),
              LabScanItem(
                serviceType: ServiceType.scan,
                serviceIcon: AssetManger.scanIcon,
                serviceText: StringManger.scans.tr(),
                navToScreen: Routes.labsServicesScreen,
              ),

            ],
          ),
        ));
  }
}
