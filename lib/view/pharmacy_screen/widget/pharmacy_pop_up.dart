import 'package:easy_localization/easy_localization.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/color_manger.dart';
import 'package:fi_khedmtk_sehtak/shared/resources/strings_manger.dart';
import 'package:fi_khedmtk_sehtak/view/pharmacy_screen/widget/pharmacy_city_dropdown.dart';
import 'package:fi_khedmtk_sehtak/view/pharmacy_screen/widget/pharmacy_region_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../shared/resources/asset_manger.dart';
import '../../select_city_screen/cubit/city_cubit.dart';


class PharmacyPopUp extends StatefulWidget {
  const PharmacyPopUp({super.key});

  @override
  State<PharmacyPopUp> createState() => _PharmacyPopUpState();
}

class _PharmacyPopUpState extends State<PharmacyPopUp> {
  @override
  void initState() {

    CityCubit.get(context).getCity();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      constraints: BoxConstraints.expand(
        width: 191.w,
        height: 285.h,
      ),
      color: ColorManger.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3),
        side: const BorderSide(width: 1, color: ColorManger.greyDropColor),
      ),
      icon: SvgPicture.asset(
        AssetManger.blueFilterIcon,
      ),
      itemBuilder: (BuildContext context) {
        return [
          PopupMenuItem(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(StringManger.filter.tr(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManger.blueColor),),
                  // ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //         minimumSize: const Size(25, 22),
                  //         backgroundColor: ColorManger.blueColor,
                  //         shape: RoundedRectangleBorder(
                  //           borderRadius: BorderRadius.circular(8),
                  //         )),
                  //     onPressed: () {
                  //      print('cityc........''${RegionCubit.get(context).selectedGovernorate?.id}');
                  //      print('region........''${RegionCubit.get(context).selectedRegion?.id}');
                  //       if (PharmacySearchCubit.get(context).validate(
                  //         city: RegionCubit.get(context).selectedGovernorate?.id,
                  //         region: RegionCubit.get(context).selectedRegion?.id,)
                  //       ) {
                  //         PharmacySearchCubit.get(context).getAllPharmacy(
                  //             city: RegionCubit.get(context).selectedGovernorate?.id,
                  //             region: RegionCubit.get(context).selectedRegion?.id,);
                  //         sl<NavigationService>().pop();
                  //       } else {
                  //         showToast(StringManger.noValueSelected.tr());
                  //       }
                  //     },
                  //     child: Text(
                  //       StringManger.done.tr(),
                  //       style: Theme.of(context).textTheme.titleMedium,
                  //     ))
                ],
              )),
          const PopupMenuItem( child: PharmacyCityDropdown()),
          const PopupMenuItem(child: PharmacyRegionDropdown()),
        ];
      },
    );
  }
}
